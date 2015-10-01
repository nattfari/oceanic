using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using BusinessLogic.Managers;
using WebHost.DataContracts.DTOs;

namespace WebHost.Configuration
{
    public class RuteResponseResolver : ValueResolver<CalculationManager.Node, RuteResponseDTO>
    {
        protected override RuteResponseDTO ResolveCore(CalculationManager.Node source)
        {
            var result = new RuteResponseDTO();

            return result;
        }
    }
}