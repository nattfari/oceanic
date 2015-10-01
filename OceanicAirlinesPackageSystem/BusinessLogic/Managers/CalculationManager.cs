using System;
using System.Collections.Generic;
using System.Linq;
using BusinessLogic.Data;
using BusinessLogic.ExternalInterfaces;
using Priority_Queue;

namespace BusinessLogic.Managers
{
    public class CalculationManager
    {
        public class Edge
        {
            public Node From;
            public Node To;
            public Route Route;
            public double Weight;
        }

        public double BeregnPris(pakke sendtPakke)
        {
            var typer = FindType(sendtPakke.SizeDepth, sendtPakke.SizeHight, sendtPakke.SizeWidth);
            var priser = DataManager.HentPakkePriser();
            var pris =
                priser.FindAll(
                    p =>
                        typer.Contains(p.DimentionsNavn) && p.FromWeight <= sendtPakke.Weight &&
                        sendtPakke.Weight <= p.ToWeight).Select(t => t.Price).ToList();
            pris.Sort();

            return pris.First();
        }

        public class Node : PriorityQueueNode
        {
            public by By;
            public double Distance;
            public Node Previous;
            public List<Edge> Ruter = new List<Edge>();
        }

        public CalculationManager() { }
        private enum Politik
        {
            Pris,
            Tid
        };

        private void GetRoutes(Node node, Politik politik, pakke sendtPakke)
        {
            if (node.Ruter != null && node.Ruter.Any())
                return;

            var ruter = new List<Edge>();

            foreach (var rute in _externalServicesApis.Select(enemy => enemy.GetRoute(node.By)))
            {
                ruter.AddRange(rute.Select(route => new Edge
                {
                    From = _nodes.FirstOrDefault(p => p.By.CityId == route.Rute.StartCity), To = _nodes.FirstOrDefault(p => p.By.CityId == route.Rute.EndCity), Weight = Politik.Pris == politik ? route.Pris : route.Rute.Time, Route = route
                }));
            }

            var ownRoutes = DataManager.HentRuter(node.By).Select(r => new Edge
            {
                        From = _nodes.FirstOrDefault(p => p.By.CityId == r.Rute.StartCity),
                        To = _nodes.FirstOrDefault(p => p.By.CityId == r.Rute.EndCity),
                        Route = r,
                        Weight = politik == Politik.Pris ? BeregnPris(sendtPakke) : r.Rute.Time
            }).ToList();

            ruter.AddRange(ownRoutes);

            var prunedList = new List<Edge>();
            foreach (var outerRoute in ruter)
            {
                if (outerRoute.From.By.CityId != node.By.CityId)
                {
                    continue;
                }
                Boolean update = true;
                double minWeight = outerRoute.Weight;
                foreach (var innerRoute in ruter)
                {
                    if (update && outerRoute.From == innerRoute.From && outerRoute.To == innerRoute.To &&
                        innerRoute.Weight < minWeight)
                    {
                        update = false;
                    }
                }
                if (update)
                    prunedList.Add(outerRoute);
            }

            node.Ruter.FindAll(r => r.Route.TransportType == TransportType.Oceanic)
                .ForEach(rout => rout.Route.Pris = BeregnPris(sendtPakke));
            node.Ruter = prunedList;
        }

        private List<by> _byliste;
        private List<Node> _nodes; 
        private IList<IExternalServicesApi> _externalServicesApis;

        public Node CalculateRouteWeight(by source, by target, IList<IExternalServicesApi> externalServicesApis,
            pakke sendtPakke)
        {
            _externalServicesApis = externalServicesApis;
            _byliste = DataManager.HentAktiveredeByer().ToList();
            foreach (var externalServicesApi in externalServicesApis)
            {
                _byliste.AddRange(externalServicesApi.GetCities().Select(e => _byliste.FirstOrDefault(p => p.CityId == e.CityId) == null ? e : null));
            }

            _byliste.RemoveAll(p => p == null);

            var result = Dijstra(source, target, Politik.Pris, sendtPakke);
            return result;
        }

        public Node CalculateRouteTime(by source, by target, IList<IExternalServicesApi> externalServicesApis, pakke sendtPakke)
        {
            _externalServicesApis = externalServicesApis;
            _byliste = DataManager.HentAktiveredeByer().ToList();
            foreach (var externalServicesApi in externalServicesApis)
            {
                _byliste.AddRange(externalServicesApi.GetCities().Select(e => _byliste.FirstOrDefault(p => p != null && p.CityId == e.CityId) == null ? e : null));
            }

            _byliste.RemoveAll(p => p == null);

            var result = Dijstra(source, target, Politik.Tid, sendtPakke);
            return result;
        }

        private IEnumerable<Node> getNeighbourghNodes(Node source, HeapPriorityQueue<Node> queue)
        {
            List<Node> nodeList = source.Ruter.ConvertAll(input => input.To);

            return nodeList;
        }

        private double DistanceBetween(Node from, Node to, Politik politik)
        {
            return from.Ruter.FirstOrDefault(p => p.From == from && p.To == to).Weight;
        }

        private Node Dijstra(by source, by target, Politik politik, pakke sendtPakke)
        {
            var queue = new HeapPriorityQueue<Node>(_byliste.Count * 2);
            _nodes = new List<Node>();
            Node targetBy = null;
            foreach (var by in _byliste)
            {
                var node = new Node
                {
                    By = by
                };

                if (by.CityId == target.CityId)
                {
                    targetBy = node;
                }

                node.Distance = by.CityId == source.CityId ? 0 : double.MaxValue;
                _nodes.Add(node);
                queue.Enqueue(node, node.Distance);
            }

            while (queue.Any())
            {
                var node = queue.Dequeue();

                if (node == targetBy && node.Distance != double.MaxValue)
                    return node;

                GetRoutes(node, politik, sendtPakke);

                foreach (var neighbour in getNeighbourghNodes(node, queue))
                {
                    if (!queue.Contains(neighbour))
                        continue;

                    var dist = node.Distance + DistanceBetween(node, neighbour, politik);
                    if (dist < neighbour.Distance)
                    {
                        neighbour.Distance = dist;
                        neighbour.Previous = node;
                        queue.UpdatePriority(neighbour, dist);
                    }
                }
            }
            return null;
        }

        private IEnumerable<string> FindType(int x, int y, int z)
        {
            var size = DataManager.HentPakkeDimensioner();
            foreach (var pakkeDimintioner in size)
            {
                var sortme = new List<int>(3) {pakkeDimintioner.Height, pakkeDimintioner.Width, pakkeDimintioner.Depth};
                sortme.Sort();
                pakkeDimintioner.Height = sortme[0];
                pakkeDimintioner.Width = sortme[1];
                pakkeDimintioner.Depth = sortme[2];
            }

            var sizes = new List<int>(3) {x, y, z};
            sizes.Sort();
            var result = size.FindAll(p => p.Height >= sizes[0] && p.Width >= sizes[1] && p.Depth >= sizes[2]);
            
            return result.ConvertAll(input => input.Name);
        }
    }
}
