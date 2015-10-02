using System.Collections.Generic;
using BusinessLogic.Data;

namespace BusinessLogic.ExternalInterfaces
{
    public interface IExternalServicesApi
    {
        IEnumerable<by> GetCities();
        IEnumerable<Route> GetRoute(by by, pakke pakke);
    }
}
