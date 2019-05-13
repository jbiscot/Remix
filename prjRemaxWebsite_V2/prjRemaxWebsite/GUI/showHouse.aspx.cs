using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Data;

namespace prjRemaxWebsite.GUI
{
    public partial class showHouse : System.Web.UI.Page
    {
        DataSet mySet;
        DataTable myTbHouses, myTbAgents, myTbMessages;
        OleDbDataAdapter myAdpMessages;

        OleDbConnection myCon;
        OleDbCommand myCmd;
        static DataRow foundAgent;

        protected void Page_Load(object sender, EventArgs e)
        {
            mySet = new DataSet();
            myCon = new OleDbConnection(@"Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + AppDomain.CurrentDomain.BaseDirectory + "App_Data/RemaxDB.mdb");
            myCon.Open();

            myCmd = new OleDbCommand("SELECT * FROM Houses", myCon);
            OleDbDataAdapter myAdpHouses = new OleDbDataAdapter(myCmd);
            myAdpHouses.Fill(mySet, "Houses");


            myCmd = new OleDbCommand("SELECT * FROM Agents", myCon);
            OleDbDataAdapter myAdpAgents = new OleDbDataAdapter(myCmd);
            myAdpAgents.Fill(mySet, "Agents");

            myCmd = new OleDbCommand("SELECT * FROM Messages", myCon);
            myAdpMessages = new OleDbDataAdapter(myCmd);
            myAdpMessages.Fill(mySet, "Messages");

            myTbAgents = mySet.Tables["Agents"];
            myTbHouses = mySet.Tables["Houses"];
            myTbMessages = mySet.Tables["Messages"];


            if (!IsPostBack)
            {
                DataColumn[] keys = new DataColumn[1];
                keys[0] = myTbHouses.Columns["refHouse"];
                myTbHouses.PrimaryKey = keys;
                

                int temp = Convert.ToInt32(Request.QueryString["HouseID"]);
                var result = from DataRow rows in myTbHouses.Rows
                             where rows.Field<int>("refHouse") == temp
                             select rows;

                DataRow foundHouse = result.First();

                  litHomeTitle.Text +=
                  "<h1 class='my-4'>" + foundHouse["hsLocation"] + "" +
                     "<small> " + foundHouse["hsType"] + "</small>" +
                  "</h1>";


                 litSelectedHouse.Text +=
                      "<div class='row'>" +
                        "<div class='col-md-8'>" +
                            "<img class='img-fluid' src='" + foundHouse["hsPicture"] + "' alt=''>" +
                        "</div>" +

                        "<div class='col-md-4'>" +
                            "<h3 class='my-3'>Description</h3>" +
                            "<p>&nbsp; " + foundHouse["hsDescription"] + "</p>" +
                            "<h3 class='my-3'>Details</h3>" +
                            "<ul>" +
                            "<li>Reference: " + foundHouse["hsNumber"] + "</li>" +
                            "<li>Price: $" + foundHouse["hsPrice"] + ".00</li>" +
                            "<li>Number of Rooms: " + foundHouse["hsRooms"] + "</li>" +
                            "<li>Number of Bathrooms: " + foundHouse["hsBathrooms"] + "</li>" +
                            "</ul>" +
                        "</div>" +
                    "</div>";


                int tempAgent = Convert.ToInt32(foundHouse["referAgent"]);

                var myAgent = from DataRow rows in myTbAgents.Rows
                              where rows.Field<int>("refAgent") == tempAgent
                              select rows;

                foundAgent = myAgent.First();


                imgAgent.ImageUrl = foundAgent["agPicture"].ToString();

                litAgentDesc.Text +=
                        "<ul>" +
                            "<li> Hi, my name is " + foundAgent["agName"] + "</li>" +
                            "<li> My agent number is :" + foundAgent["agNumber"] + "</li>" +
                            "<li> I identify myself as a " + foundAgent["agGender"] + "</li>" +
                            "<li> I live in " + foundAgent["agCity"] + "</li>" +
                            "<li> I speak " + foundAgent["agLanguage"] + "</li>" +
                            "<li> Contact me to visit the house!</li>" +
                        "</ul>";


            }

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            DataRow myRow = myTbMessages.NewRow();
            myRow["msgTitle"] = txtTitle.Text;
            myRow["msgText"] = txtMessage.Text;
            myRow["sender"] = txtEmail.Text;
            myRow["receiver"] = foundAgent["refAgent"];

            myTbMessages.Rows.Add(myRow);
            OleDbCommandBuilder myBuild = new OleDbCommandBuilder(myAdpMessages);
            myAdpMessages.Update(myTbMessages);



            txtEmail.Text = "";
            txtMessage.Text = "";
            txtTitle.Text = "";
            lblMessageSent.Visible = true;
        }
    }
}