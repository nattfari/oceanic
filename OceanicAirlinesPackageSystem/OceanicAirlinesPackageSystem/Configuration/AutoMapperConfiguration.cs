﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;

namespace WebHost.Configuration
{
    public class AutoMapperConfiguration
    {
        public static void Configure()
        {
            Mapper.Initialize(x =>
            {
                x.AddProfile<DomainToDTOMappingProfile>();
            });
        }
    }
}