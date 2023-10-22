using Microsoft.AspNetCore.Mvc;

namespace The_Projects_Grimoire.Controllers
{
    public class ProjectController : Controller
    {
        public IActionResult Dashboard() 
        {
            return View();
        }
    }
}
