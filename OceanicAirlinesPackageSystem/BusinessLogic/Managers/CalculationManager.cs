using System;
using System.Collections;
using System.Collections.Generic;
using System.ComponentModel;
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

        public double BeregnPris(int length, int width , int height)
        {
            return 11;
        }

        public class Node : PriorityQueueNode
        {
            public by By;
            public double Distance;
            public Node Previous;
            public List<Edge> Ruter = new List<Edge>();
        }

        DataManager dataManager = new DataManager();
        public CalculationManager() { }
        private enum Politik
        {
            Pris,
            Tid
        };

        private void GetRoutes(Node node, Politik politik)
        {
            if (node.Ruter != null && node.Ruter.Any())
                return;

            var ruter = new List<Edge>();

            foreach (var rute in externalServicesApis.Select(enemy => enemy.GetRoute(node.By)))
            {
                ruter.AddRange(rute.Select(route => new Edge
                {
                    From = nodes.FirstOrDefault(p => p.By.CityId == route.Rute.StartCity), To = nodes.FirstOrDefault(p => p.By.CityId == route.Rute.EndCity), Weight = Politik.Pris == politik ? route.Pris : route.Rute.Time, Route = route
                }));
            }

            var ownRoutes = DataManager.HentRuter(node.By).Select(r => new Edge
            {
                        From = nodes.FirstOrDefault(p => p.By.CityId == r.Rute.StartCity),
                        To = nodes.FirstOrDefault(p => p.By.CityId == r.Rute.EndCity),
                        Route = r,
                        Weight = politik == Politik.Pris ? BeregnPris(11, 1, 1) : r.Rute.Time
            }).ToList();

            ruter.AddRange(ownRoutes);

            List<Edge> prunedList = new List<Edge>();
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
            
            node.Ruter = prunedList;
        }

        private List<by> byliste;
        private List<Node> nodes; 
        private List<IExternalServicesApi> externalServicesApis;

        public Node CalculateRouteTime(by source, by target, List<IExternalServicesApi> externalServicesApis)
        {
            this.externalServicesApis = externalServicesApis;
            byliste = DataManager.HentByer().ToList();
            foreach (var externalServicesApi in externalServicesApis)
            {
                byliste.AddRange(externalServicesApi.GetCities().Select(e => byliste.FirstOrDefault(p => p.CityId == e.CityId) == null ? e : null));
            }

            byliste.RemoveAll(p => p == null);

            var result = Dijstra(source, target, Politik.Tid);
            return result;
        }

        private IList<Node> getNeighbourghNodes(Node source, HeapPriorityQueue<Node> queue)
        {
            List<Node> nodeList = source.Ruter.ConvertAll(input => input.To);

            return nodeList;
        }

        private double DistanceBetween(Node from, Node to, Politik politik)
        {
            return from.Ruter.FirstOrDefault(p => p.From == from && p.To == to).Weight;
        }

        private Node Dijstra(by source, by target, Politik politik)
        {
            var queue = new HeapPriorityQueue<Node>(byliste.Count * 2);
            nodes = new List<Node>();
            Node targetBy = null;
            foreach (var _by in byliste)
            {
                var node = new Node
                {
                    By = _by
                };

                if (_by.CityId == target.CityId)
                {
                    targetBy = node;
                }

                node.Distance = _by.CityId == source.CityId ? 0 : double.MaxValue;
                nodes.Add(node);
                queue.Enqueue(node, node.Distance);
            }

            while (queue.Any())
            {
                var node = queue.Dequeue();

                if (node == targetBy && node.Distance != double.MaxValue)
                    return node;

                GetRoutes(node, politik);

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

        public IEnumerable<string> FindType(int x, int y, int z)
        {
            var result = new List<string>();
            return result;
        }
    }
}
