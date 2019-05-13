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
    public partial class index : System.Web.UI.Page
    {
        DataSet mySet;
        DataTable myTbHouses, myTbAgents, myTbMessages;

        OleDbConnection myCon;
        OleDbCommand myCmd;

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
            OleDbDataAdapter myAdpMessages = new OleDbDataAdapter(myCmd);
            myAdpMessages.Fill(mySet, "Messages");

            myTbAgents = mySet.Tables["Agents"];
            myTbHouses = mySet.Tables["Houses"];
            myTbMessages = mySet.Tables["Messages"];


            if (!IsPostBack)
            {
                //Filling the dropDownList with all the available agents
                foreach (DataRow agent in myTbAgents.Rows)
                {                   
                    drpAgent.Items.Add(new ListItem(agent["agName"].ToString(), agent["refAgent"].ToString()));
                }
                drpAgent.Items.Insert(0, new ListItem("Agent", ""));


                //Filling the dropDownList Bathrooms
                for (int i = 1; i<6; i++)
                {
                    drpBaths.Items.Add(new ListItem(i.ToString()));
                }
                drpBaths.Items.Insert(0, new ListItem("Bathrooms", ""));


                //Filling the dropDownList Bedrooms
                for (int i = 1; i < 9; i++)
                {
                    drpBeds.Items.Add(i.ToString());
                }
                drpBeds.Items.Insert(0, new ListItem("Bedrooms", ""));


                //Filling the dropDownList Minimun Price
                for (int i = 0; i <= 500000; i+= 20000)
                {
                    drpMin.Items.Add(i.ToString());
                }
                drpMin.Items.Insert(0, new ListItem("Select Min. Price", ""));

                //Filling the dropDownList Maximun Price
                for (int i = 0; i <= 500000; i += 20000)
                {
                    drpMax.Items.Add(i.ToString());
                }
                drpMax.Items.Insert(0, new ListItem("Select Max. Price", ""));


                //Filling the page Search Restul Text
                litSearchRes.Text +=
                    "<h1 class='my-4'>Hi! " +
                       "<small> These all the units we have, check them out!</small>" +
                    "</h1>";

                //Filling the page with all the available houses
                foreach (DataRow house in myTbHouses.Rows)
                {
                    fillHouseCards(house);
                }
            }
        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            litHouseCards.Text = "";
            litSearchRes.Text = "";

            bool noneChecked = true;

            var result = from DataRow myRow in myTbHouses.Rows
                         select myRow;

            if (txtHouseNum.Text != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsNumber='" + (txtHouseNum.Text) + "'");
            }

            if (drpType.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsType='" + (drpType.SelectedItem.Value.ToString()) + "'");
            }

            if (drpCity.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsLocation='" + (drpCity.SelectedItem.Value.ToString()) + "'");
            }


            if (drpMin.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsPrice>" + (drpMin.SelectedItem.Value.ToString()));
            }

            if (drpMax.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsPrice<" + (drpMax.SelectedItem.Value.ToString()));
            }

            if (drpBeds.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsRooms='" + (drpBeds.SelectedItem.Value.ToString()) + "'");
            }

            if (drpBaths.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("hsBathrooms='" + (drpBaths.SelectedItem.Value.ToString()) + "'");
            }

            if (drpAgent.SelectedItem.Value != "" && result.Any())
            {
                noneChecked = false;
                result = result.CopyToDataTable().Select("referAgent='" + (drpAgent.SelectedItem.Value.ToString()) + "'");
            }    

            if (result.Any())
            {
                //Data Found Text Result
                litSearchRes.Text +=
                    "<h1 class='my-4'>Yes, " +
                        "<small> look what we found!</small>" +
                    "</h1><br>";

                foreach (DataRow Row in result)
                {
                    fillHouseCards(Row);
                }
            }
            else if (noneChecked)
            {
                litSearchRes.Text +=
                    "<h1 class='my-4'>Hi! " +
                       "<small> These are all the units we have, check them out!</small>" +
                    "</h1>";
            }
            else
            {
                //No data Found Text Result
                litHouseCards.Text = "";
                litSearchRes.Text = "";
                litSearchRes.Text +=
                    "<h1 class='my-4'>Sorry..." +
                        "<small> Close, but no cigar.</small> " +
                    "</h1>";
            }
        }

        private void fillHouseCards(DataRow inputRow)
        {
            LinkButton test = new LinkButton();        
            test.Text = "test";

            litHouseCards.Text +=
                    "<div class='col-lg-4 col-sm-6 mb-4'>" +
                       "<asp:Panel ID = 'panelHouse'  class='card h-100'>" +
                            "<a href='showHouse.aspx?HouseID=" + inputRow["refHouse"] + "'><img class='card-img-top' src='" + inputRow["hsPicture"] + "' alt=''></a>" +
                                "<div class='card-body'>" +
                                    "<h4 class='card-title'>" +
                                        "<a href='showHouse.aspx?HouseID=" + inputRow["refHouse"] + "'> $" + inputRow["hsPrice"] + "</a>" +
                                         "<span><i>Ref.: " + inputRow["hsNumber"] + "</i></span>" +
                                    "</h4>" +
                                    "<p class='card-text'>" +
                                        "<span><strong>" + inputRow["hsType"] + "</strong></span><br/> " +
                                        "<span>" + inputRow["hsLocation"] + "</span><br/> " +
                                        "<span>Rooms: " + inputRow["hsRooms"] + "</span><br/> " +
                                        "<span>Bathrooms: " + inputRow["hsBathrooms"] + "</span><br/><br/> " +
                                        "<span>" + inputRow["hsDescription"] +
                                    "</p>" +
                                "</div>" +
                                "<button type='button' id='btnMoreInfo" + inputRow["refHouse"] + " ' class='btn btn-light' value='" + inputRow["refHouse"] + "' onclick='setSession(this);'>More Info</button>" +
                                //"<button type='button' id='btnMoreInfo' class='btn btn-light' onclick='location = 'showHouse.apsx'>More Info</button>" +
                         "</asp:Panel >" +                    
                    "</div>";  

        }
    }
}