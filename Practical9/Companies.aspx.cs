using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Practical9
{
    public partial class Companies : Page
    {
        // Connection string is taken from Web.config (name = "PlacementDB")
        private readonly string cs =
            ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data only on the first request, not on postbacks
            if (!IsPostBack)
            {
                LoadCompanies();
                LoadPlacements();
            }
        }

        // Binds the Placements table to the Repeater data control
        private void LoadCompanies()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Placements";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                rptCompanies.DataSource = dt;
                rptCompanies.DataBind();
            }
        }

        // Binds the Placements table to the DataList data control
        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Placements";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dlPlacements.DataSource = dt;
                dlPlacements.DataBind();
            }
        }
    }
}
