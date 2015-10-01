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
            public Route route;
            public double Tid;
            public double Pris;
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

        private void GetRoutes(Node node)
        {
            if (node.Ruter != null && node.Ruter.Any())
                return;

            var ruter = new List<Edge>();

            foreach (var enemy in externalServicesApis)
            {
                var rute = enemy.GetRoute(node.By);
                foreach (var route in rute)
                {
                    var edge = new Edge
                    {
                        From = nodes.FirstOrDefault(p => p.By.CityId == route.Rute.StartCity),
                        To = nodes.FirstOrDefault(p => p.By.CityId == route.Rute.EndCity),
                        Pris = route.Pris,
                        Tid = route.Rute.Time,
                        route = route
                    };

                    ruter.Add(edge);
                }
            }

            var ownRoutes = DataManager.HentRuter(node.By).Select(r => new Edge
            {
                        From = nodes.FirstOrDefault(p => p.By.CityId == r.Rute.StartCity),
                        To = nodes.FirstOrDefault(p => p.By.CityId == r.Rute.EndCity),
                        Pris = BeregnPris(11, 11, 11),
                        Tid = r.Rute.Time,
                        route = r
            });

            ruter.AddRange(ownRoutes);

            node.Ruter = ruter;
        }

        private List<by> byliste;
        private List<Node> nodes; 
        private List<IExternalServicesApi> externalServicesApis;

        public void CalculateRouteTime(by source, by target, List<IExternalServicesApi> externalServicesApis)
        {
            this.externalServicesApis = externalServicesApis;
            byliste = DataManager.HentByer().ToList();
            foreach (var externalServicesApi in externalServicesApis)
            {
                var q = externalServicesApi.GetCities();
                byliste.AddRange(q);
            }

            var result = Dijstra(source, target, Politik.Tid);
            return;
        }

        private IList<Node> getNeighbourghNodes(Node source, HeapPriorityQueue<Node> queue)
        {
            List<Node> nodeList = source.Ruter.ConvertAll(input => input.To);

            return nodeList;
        }

        private double DistanceBetween(Node from, Node to, Politik politik)
        {
            var node = from.Ruter.FirstOrDefault(p => p.From == from && p.To == to);

            if (politik == Politik.Pris)
                return node.Pris;

            return node.Tid;
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

                if (node == targetBy)
                    return node;

                GetRoutes(node);

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
    }
}
