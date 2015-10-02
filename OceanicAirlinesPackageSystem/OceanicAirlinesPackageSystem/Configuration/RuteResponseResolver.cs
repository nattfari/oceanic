using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using AutoMapper;
using BusinessLogic.Data;
using BusinessLogic.Managers;
using WebHost.DataContracts.DTOs;

namespace WebHost.Configuration
{
    public class RuteResponseResolver : ITypeConverter<CalculationManager.Node, RuteDTO>
    {        
        public RuteDTO Convert(ResolutionContext context)
        {
            if (context == null || context.IsSourceValueNull)
                return null;

            CalculationManager.Node rute = (CalculationManager.Node) context.SourceValue;

            var result = new RuteDTO()
            {
                RuteTrin = new List<RuteTrinDTO>()
            };

            RuteTrinDTO ruteTrinAggregate = new RuteTrinDTO();

            Route previousRuteTrin = null;
            string previousOperator = "";

            while (rute.Previous != null)
            {
                var ruteTrin =
                rute.Previous.Ruter.SingleOrDefault(x => x.To.By == rute.By && x.From.By == rute.Previous.By)
                    .Route;

                if (String.IsNullOrEmpty(ruteTrinAggregate.TilBy))
                {
                    ruteTrinAggregate.TilBy = rute.By.Name;
                }
                if (String.IsNullOrEmpty(ruteTrinAggregate.TransportType))
                {
                    ruteTrinAggregate.TransportType = ruteTrin.TransportType.ToString();
                }

                if (!String.IsNullOrEmpty(previousOperator) && previousOperator != ruteTrin.TransportType.ToString() || rute.Previous == null)
                {

                    //transport type changed - set fraBy and add step aggregate to steps                    
                    ruteTrinAggregate.FraBy = rute.By.Name;
                    result.RuteTrin.Add(ruteTrinAggregate);
                    //step added - reset
                    ruteTrinAggregate = new RuteTrinDTO();

                }
                else
                {
                    ruteTrinAggregate.Pris += ruteTrin.Pris;
                    ruteTrinAggregate.Tid += ruteTrin.Rute.Time;
                }

                previousOperator = ruteTrin.TransportType.ToString();

                rute = rute.Previous;

                if (rute.Previous == null)
                {
                    if (previousRuteTrin != null && ruteTrinAggregate.TilBy == null)
                          ruteTrinAggregate.TilBy = DataManager.HentBy(previousRuteTrin.Rute.StartCity).Name;
                    //last node - finish and add step
                    ruteTrinAggregate.TransportType = ruteTrin.TransportType.ToString();
                    ruteTrinAggregate.Pris += ruteTrin.Pris;
                    ruteTrinAggregate.Tid += ruteTrin.Rute.Time;
                    ruteTrinAggregate.FraBy = rute.By.Name;
                    result.RuteTrin.Add(ruteTrinAggregate);
                }

                previousRuteTrin = ruteTrin;
            }

            return result;
        }
    }
}