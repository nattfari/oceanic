﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using BusinessLogic.Data;
using BusinessLogic.Managers;
using WebHost.DataContracts.DTOs;

namespace WebHost.Configuration
{
    public class GetRouteFromDatabase 
    {
        public RuteDTO Convert(int q)
        {
            var gemteForsendelser = DataManager.HentGemteForsendelser().FirstOrDefault(p => p.Id == q);
            var DTO = new RuteDTO
            {
                RuteTrin = new List<RuteTrinDTO>(),
                RuteId = gemteForsendelser.Id
            };
            var forsendelsesRuter = DataManager.HentForsendelsesRute(q);
            var totalpris = 0;
            var totaltid = 0;
            foreach (var forsendelsesRute in forsendelsesRuter)
            {
                var trin = new RuteTrinDTO
                {
                    FraBy = DataManager.HentBy(forsendelsesRute.StartBy.Value).Name,
                    TilBy = DataManager.HentBy(forsendelsesRute.SlutBy.Value).Name,
                    Tid = forsendelsesRute.TransportTime,
                    Pris = forsendelsesRute.Price,
                    TransportType = ((TransportType)forsendelsesRute.TransportType.Value).ToString()
                };
                DTO.RuteTrin.Add(trin);
                totalpris += (int)(forsendelsesRute.Price);
                totaltid += forsendelsesRute.TransportTime;
            }

            DTO.TotalPris = totalpris;
            DTO.TotalTid = totaltid;
            return DTO;
        }
      }
}