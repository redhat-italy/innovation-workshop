using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System.Data.SqlClient;
using System.Text;

namespace RestAPP.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class BooksStockController : ControllerBase
    {
        private static readonly string[] Summaries = new[]
        {
            "Freezing", "Bracing", "Chilly", "Cool", "Mild", "Warm", "Balmy", "Hot", "Sweltering", "Scorching"
        };

        private readonly ILogger<BooksStockController> _logger;

        public BooksStockController(ILogger<BooksStockController> logger)
        {
            _logger = logger;
        }

        [HttpGet("/booksavailability/{id}")]
        public ActionResult<BookStockInfo> Get(int id)
        {
            BookStockInfo bookStockInfo = null;

            try
            {
                //SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();            
                //Server=HC-SERVER-04,1433;Database=IBCore_Lange;User Id=sa;password=XXX

                //builder.DataSource = "<your_server.database.windows.net>";
                //builder.UserID = "sa";
                //builder.Password = "password.1";
                //builder.InitialCatalog = "<your_database>";


                var serverhost = "localhost,1433";

                using (SqlConnection connection = new SqlConnection("Server=" + serverhost + ",1433;User Id=sa;password=password.1"))
                {
                    connection.Open();

                    String sql = "SELECT  bookid, quantity FROM booksinventory WHERE bookid = " + id;

                    using (SqlCommand command = new SqlCommand(sql, connection))
                    {
                        using (SqlDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                bookStockInfo = new BookStockInfo { id = reader.GetInt32(0), quantity = reader.GetInt32(1) };
                            }
                            reader.Close();
                        }
                    }

                    connection.Close();
                }

            }
            catch (SqlException e)
            {
                Console.WriteLine(e.ToString());
            }

            return bookStockInfo;

        }
    }
}
