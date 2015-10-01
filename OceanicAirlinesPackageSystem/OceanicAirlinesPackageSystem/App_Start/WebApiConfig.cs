using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Http;
using Newtonsoft.Json.Serialization;

namespace WebHost
{
    public static class WebApiConfig
    {
        public static void Register(HttpConfiguration config)
        {
            // Web API configuration and services

            // Web API routes
            config.MapHttpAttributeRoutes();

            config.Formatters.JsonFormatter.SupportedEncodings.Add(Encoding.UTF8);
            config.Formatters.JsonFormatter.SerializerSettings.DateFormatHandling =
                Newtonsoft.Json.DateFormatHandling.IsoDateFormat;
            config.Formatters.JsonFormatter.SerializerSettings.DateTimeZoneHandling = 
                Newtonsoft.Json.DateTimeZoneHandling.Utc;
            config.Formatters.JsonFormatter.UseDataContractJsonSerializer = true; 
        }
    }
}
