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
            public double Time;
            public double Cost;
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
            if (node.Ruter != null)
                return;
            //Kald til hent ruter, og lav en liste med ruter, som gemmes!
        }

        private List<by> byliste;

        public void CalculateRouteTime(by source, by target, List<IExternalServicesApi> externalServicesApis)
        {
            byliste = DataManager.HentByer().ToList();
            foreach (var externalServicesApi in externalServicesApis)
            {
                var q = externalServicesApi.GetCities();
            }
            byliste.Add(source);
            byliste.Add(target);
            Dijstra(source, target, Politik.Tid);
            return;
        }

        private IList<Node> getNeighbourghNodes(Node source, HeapPriorityQueue<Node> queue)
        {
            List<Node> nodes = source.Ruter.ConvertAll(input => input.To);

            return nodes;
        }

        private double DistanceBetween(Node from, Node to, Politik politik)
        {
            var node = from.Ruter.FirstOrDefault(p => p.From == from && p.To == to);

            if (politik == Politik.Pris)
                return node.Cost;
            return node.Time;
        }

        private Node Dijstra(by source, by target, Politik politik)
        {
            var queue = new HeapPriorityQueue<Node>(byliste.Count);
            Node targetBy = null;
            foreach (var _by in byliste)
            {
                var node = new Node
                {
                    By = _by
                };

                if (_by == target)
                {
                    targetBy = node;
                }

                node.Distance = _by == source ? 0 : double.MaxValue;
                
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

        public IEnumerable<string> FindType(int x, int y, int z)
        {
            var result = new List<string>();
            return result;
        }
    }
}
