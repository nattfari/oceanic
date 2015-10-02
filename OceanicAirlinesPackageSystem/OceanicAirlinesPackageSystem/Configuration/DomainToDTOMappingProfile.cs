using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using BusinessLogic.Data;
using BusinessLogic.Managers;
using ExternalServices.DataContracts;
using WebHost.DataContracts.DTOs;
using CityDTO = WebHost.DataContracts.DTOs.CityDTO;

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
            Mapper.CreateMap<CalculationManager.Node, RuteDTO>().ConvertUsing<RuteResponseResolver>();

            Mapper.CreateMap<@by, CityDTO>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name))
                .ForMember(dest => dest.IsActive, opt => opt.MapFrom(src => src.Active));

            Mapper.CreateMap<@by, LufthavnDTO>()
                .ForMember(dest => dest.Id, opt => opt.MapFrom(src => src.Id))
                .ForMember(dest => dest.Name, opt => opt.MapFrom(src => src.Name))
                .ForMember(dest => dest.IsActive, opt => opt.MapFrom(src => src.Active));
        }
    }
}