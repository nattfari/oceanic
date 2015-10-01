using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using BusinessLogic.Managers;
using WebHost.DataContracts.DTOs;

namespace WebHost.Configuration
{
    public class RuteResponseResolver : ITypeConverter<CalculationManager.Node, RuteResponseDTO>
    {        
        public RuteResponseDTO Convert(ResolutionContext context)
        {
            if (context == null || context.IsSourceValueNull)
                return null;

            CalculationManager.Node rute = (CalculationManager.Node) context.SourceValue;

            var result = new RuteResponseDTO();
            return result;
        }
    }
}