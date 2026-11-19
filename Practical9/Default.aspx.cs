using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Practical9
{
    public partial class Default : Page
    {
        // Connection string is taken from Web.config (name = "PlacementDB")
        private readonly string cs =
            ConfigurationManager.ConnectionStrings["PlacementDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load data only on the first request, not on postbacks
            if (!IsPostBack)
            {
                LoadSummary();
                LoadPlacements();
            }
        }

        // Fills the summary labels using aggregate queries on the database
        private void LoadSummary()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                con.Open();

                // Total number of students
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Students", con);
                lblTotal.Text = cmd.ExecuteScalar().ToString();

                // Students who are placed (IsPlaced = 1)
                cmd.CommandText = "SELECT COUNT(*) FROM Students WHERE IsPlaced = 1";
                lblPlaced.Text = cmd.ExecuteScalar().ToString();

                // Students who are not placed yet (IsPlaced = 0)
                cmd.CommandText = "SELECT COUNT(*) FROM Students WHERE IsPlaced = 0";
                lblUnplaced.Text = cmd.ExecuteScalar().ToString();

                // Highest package offered, from the Placements table
                cmd.CommandText = "SELECT MAX(PackageLPA) FROM Placements";
                object result = cmd.ExecuteScalar();
                decimal highest = result == DBNull.Value ? 0 : Convert.ToDecimal(result);
                lblHighestPackage.Text = highest.ToString("N2");

                // Placement percentage = placed / total * 100
                int total = Convert.ToInt32(lblTotal.Text);
                int placed = Convert.ToInt32(lblPlaced.Text);
                decimal percentage = total == 0 ? 0 : (decimal)placed * 100 / total;
                lblPercentage.Text = percentage.ToString("N2") + "%";
            }
        }

        // Binds the Students table to the GridView data control
        private void LoadPlacements()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Students";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvPlacements.DataSource = dt;
                gvPlacements.DataBind();
            }
        }
    }
}
