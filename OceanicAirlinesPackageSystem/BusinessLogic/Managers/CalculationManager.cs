using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Priority_Queue;

namespace BusinessLogic.Managers
{
    public class By
    {
        public int Id;
        public String Navn;
    }

    public class Edge
    {
        public Node From;
        public Node To;
        public double Time;
        public double Cost;
    }

    public class Node : PriorityQueueNode
    {
        public int Id;
        public double Distance;
        public Node Previous;
        public List<Edge> Ruter = new List<Edge>();
    }

    public class CalculationManager
    {
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

        List<By> byliste = new List<By>();
        public void CalculateRouteTime(By source, By target)
        {
            
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

        private Node Dijstra(By source, By target, Politik politik)
        {
            var queue = new HeapPriorityQueue<Node>(byliste.Count);
            Node targetBy = null;
            foreach (var by in byliste)
            {
                var node = new Node
                {
                    Id = by.Id
                };

                if (by == target)
                {
                    targetBy = node;
                }

                node.Distance = @by == source ? 0 : double.MaxValue;
                
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
