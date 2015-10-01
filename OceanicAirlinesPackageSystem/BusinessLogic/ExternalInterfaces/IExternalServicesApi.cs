using System.Collections.Generic;

namespace BusinessLogic.ExternalInterfaces
{
    public interface IExternalServicesApi
    {
        IEnumerable<string> GetCities();
        IEnumerable<string> GetRoute();
    }
}
