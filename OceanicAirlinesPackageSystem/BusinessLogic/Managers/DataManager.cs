﻿using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using BusinessLogic.Data;

namespace BusinessLogic.Managers
{
    public class DataManager
    {
        public static IList<by> HentAktiveredeByer()
        {
            using (var context = new OADbContext())
            {
                return (from byen in context.@by
                    where byen.Active
                            select byen).ToList();
            }
        }

        public static void OpretRute(forsendelse rute)
        {
            using (var context = new OADbContext())
            {
                context.forsendelse.Add(rute);
                context.SaveChanges();
            }
        }

        public static IList<by> HentDeaktiveredeByer()
        {
            using (var context = new OADbContext())
            {
                return (from byen in context.@by
                        where !byen.Active
                        select byen).ToList();
            }
        }

        public static IList<Route> HentRuter(by _by)
        {
            using (var context = new OADbContext())
            {
                return (from ruteObjekt in context.rute
                    where ruteObjekt.StartCity == _by.CityId
                    select ruteObjekt).Select(r => new Route {Rute = r, TransportType = TransportType.Oceanic}).ToList();
            }
        }

        public static List<pakkeDimintioner> HentPakkeDimensioner()
        {
            using (var context = new OADbContext())
            {
                return context.pakkeDimintioner.ToList();
            }
        }

        public static void GemForsendelse(forsendelse forsendelse)
        {
            using (var context = new OADbContext())
            {
                forsendelse.Saved = true;
                context.forsendelse.AddOrUpdate(forsendelse);
                context.SaveChanges();
            }
        }

        public static List<forsendelse> HentGemteForsendelser()
        {
            using (var context = new OADbContext())
            {
                return context.forsendelse.ToList().FindAll(p => p.Saved);
            }
        }

        public static List<pakkePris> HentPakkePriser()
        {
            using (var context = new OADbContext())
            {
                return context.pakkePris.ToList();
            }
        }

        public static void DeaktiverBy(by by)
        {
            by.Active = false;
            using (var context = new OADbContext())
            {
                 context.by.AddOrUpdate(by);
                 context.SaveChanges();
            }
        }

        public static void AktiverBy(by by)
        {
            by.Active = true;
            using (var context = new OADbContext())
            {
                context.by.AddOrUpdate(by);
                context.SaveChanges();
            }
        }
    }
}
