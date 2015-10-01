using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using BusinessLogic.Managers;
using WebHost.DataContracts.DTOs;

namespace WebHost.Configuration
{
    public class DomainToDTOMappingProfile : Profile
    {
        public override string ProfileName
        {
            get { return "DomainToDTOMappingProfile"; }
        }

        protected override void Configure()
        {
            Mapper.CreateMap<CalculationManager.Node, RuteResponseDTO>();
        }
    }
}