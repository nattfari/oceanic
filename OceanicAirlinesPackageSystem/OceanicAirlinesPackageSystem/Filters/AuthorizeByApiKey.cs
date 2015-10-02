using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Results;
using WebHost.DataContracts;

namespace WebHost.Filters
{
    public class AuthorizeByApiKey : System.Web.Http.AuthorizeAttribute
    {       
        protected override void HandleUnauthorizedRequest(HttpActionContext actionContext)
        {
            var errorMessage = new ErrorMessageResponse((int) HttpStatusCode.Unauthorized,
                "Unauthorized API call. No or invalid API key supplied.", DateTime.Now.ToString("o"));

            actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized, errorMessage, GlobalConfiguration.Configuration.Formatters.JsonFormatter);
        }

        

        public override void OnAuthorization(HttpActionContext actionContext)
        {
            var authorization = actionContext.Request.Headers.Authorization;

            if (authorization != null)
            {
                var apiKey = authorization.ToString();
                if (!apiKey.Equals("a23fd6ce-c28a-4730-a993-b52187eed7bf") &&
                    !apiKey.Equals("aa16a0c8-e0be-4c17-80e1-e596ae5f0fa9"))
                {
                    actionContext.Response = new HttpResponseMessage(HttpStatusCode.Unauthorized);

                }
                else
                {
                    return;
                }
            }
            
            base.OnAuthorization(actionContext);
        }
    }
}