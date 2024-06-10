using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace BiteBox.DAL
{
    public class Restaurant
    {
        public int Rest_id { get; set; }
        public string Rest_name { get; set; }
        public string Rest_password { get; set; }
        public string Rest_description { get; set; }
        public string Rest_location { get; set; }
        public string Rest_email { get; set; }
        public float Sales_tax { get; set; }
        public int Order_lead_time { get; set; }
        public int Delivery_extra_time { get; set; }
    }
    public class Customer
    {
        public int Cust_id { get; set; }
        public string Cust_Name { get; set; }
        public string Cust_email { get; set; }
        public string Cust_password { get; set; }
        public string Cust_phone { get; set; }
        public string Cust_location { get; set; }
    }

    public class BiteBoxDAL
    {
        private static readonly string connString = System.Configuration.ConfigurationManager.ConnectionStrings["sqlCon1"].ConnectionString;

        //--------------------------LOGIN FUNCTIONS-----------------------------
        public string CustomerLogin(string email, string pwd)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("userLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@cust_email", email);
            cmd.Parameters.AddWithValue("@cust_password", pwd);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {
                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        public string AdminLogin(string email, string pwd)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("adminLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@ad_email", email);
            cmd.Parameters.AddWithValue("@ad_password", pwd);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {
                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        public string RestaurantLogin(string email, string pwd)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("restaurantLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@restemail", email);
            cmd.Parameters.AddWithValue("@restPwd", pwd);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {
                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        public string RiderLogin(string email, string pwd)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("Rider_Login", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_rider_email", email);
            cmd.Parameters.AddWithValue("@p_rider_password", pwd);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {

                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        //--------------------------SIGN UP FUNCTIONS-------------------------------
        public string Customersignup(string email, string pwd, string name, string phone, string location)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("User_Signup", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_Email", email);
            cmd.Parameters.AddWithValue("@p_Password", pwd);
            cmd.Parameters.AddWithValue("@p_Username", name);
            cmd.Parameters.AddWithValue("@p_PhoneNumber", phone);
            cmd.Parameters.AddWithValue("@p_location", location);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {
                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        public string Restaurantsignup(string email, string pwd, string name, string descr, string location, int orderLead, int deliveryTime, float salesTaxP)
        {
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("Restaurant_Signup", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@p_Email", email);
            cmd.Parameters.AddWithValue("@p_RestaurantPassword", pwd);
            cmd.Parameters.AddWithValue("@p_RestaurantName", name);
            cmd.Parameters.AddWithValue("@p_RestaurantDescription", descr);
            cmd.Parameters.AddWithValue("@p_Location", location);
            cmd.Parameters.AddWithValue("@p_SalesTax", salesTaxP);
            cmd.Parameters.AddWithValue("@p_OrderLeadTime", orderLead);
            cmd.Parameters.AddWithValue("@p_DeliveryExtraTime", deliveryTime);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {
                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        public string Ridersignup(string email, string pwd, string name, string phone, string lic, string location)
        {
          
            SqlConnection con = new SqlConnection(connString);
            SqlCommand cmd = new SqlCommand("RiderSignup", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@riderEmail", email);
            cmd.Parameters.AddWithValue("@riderPassword", pwd);
            cmd.Parameters.AddWithValue("@riderName", name);
            cmd.Parameters.AddWithValue("@riderPhone", phone);
            cmd.Parameters.AddWithValue("@riderLicense", lic);
            cmd.Parameters.AddWithValue("@riderLocation", location);
            cmd.Parameters.AddWithValue("@riderBalance", 0);
            cmd.Parameters.AddWithValue("@riderRating", 0);
            cmd.Parameters.AddWithValue("@riderTtlOrders", 0);

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 51000)
                {
                    return ex.Message;
                }
                else
                {
                    return "An unexpected error occurred. Please try again later.";
                }
            }
            finally
            {
                con.Close();
            }

            return "";
        }

        // ----------------------------GET INFO FUNCTION
        public object RestaurantInfo(string email, string column)
        {
            object result = null;
            string query = $"SELECT {column} FROM Restaurant WHERE rest_email = @Email";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        result = command.ExecuteScalar();

                        if (result != null && result != DBNull.Value)
                        {
                            if (column == "IntColumn")
                            {
                                result = Convert.ToInt32(result);
                            }
                            else if (column == "FloatColumn")
                            {
                                result = Convert.ToSingle(result);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error: " + ex.Message);
                    }
                }
            }

            return result;
        }

        //-------------------------UPDATE FUNCTIONS
        public string updateRestaurant(string email, string descr, int ordertime, int delivery, float tax)
        {
            string query = "UPDATE Restaurant SET rest_description = @NewDescr, sales_tax = @NewST, order_lead_time = @NewOLT, delivery_extra_time = @NewDET WHERE rest_email = @Email";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@NewDescr", descr);
                    command.Parameters.AddWithValue("@NewST", tax);
                    command.Parameters.AddWithValue("@NewOLT", ordertime);
                    command.Parameters.AddWithValue("@NewDET", delivery);
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        int rowsAffected = 0;
                        rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected != 0)
                        {
                            return "Profile Updated successfully";
                        }
                        else
                        {
                            return "Could not update profile";
                        }
                    }
                    catch (Exception ex)
                    {
                        return ex.Message;
                    }
                }
            }
        }

        //------------------------------MENU MANAGER FUNCTIONS
        public DataSet SelectItem(string email, ref string errorIfApplicable)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand idFetcher;
            SqlCommand cmd;
            try
            {
                idFetcher = new SqlCommand("SELECT rest_id FROM Restaurant WHERE rest_email = @Email", con);
                idFetcher.Parameters.AddWithValue("@Email", email);
                object result = idFetcher.ExecuteScalar();
                int restaurantID = Convert.ToInt32(result);

                cmd = new SqlCommand("SELECT * FROM Restaurant_Menu WHERE rest_id = " + restaurantID.ToString(), con);
                cmd.CommandType = CommandType.Text;
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    errorIfApplicable = "No menu items found for the restaurant.";
                }
                con.Close();
            }

            return ds;
        }

        public int DeleteItem(int id)
        {
            int result = 0;
            using (SqlConnection con = new SqlConnection(connString))
            {
                using (SqlCommand cmd = new SqlCommand("Remove_Menu_Item", con))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.Add("@p_MenuID", SqlDbType.Int).Value = id;
                    try
                    {
                        con.Open();
                        result = cmd.ExecuteNonQuery();
                    }
                    catch (SqlException ex)
                    {
                        Console.WriteLine("SQL Error: " + ex.Message);
                        throw;
                    }
                }
            }
            return result;
        }

        public int UpdateItem(int id, string name, string categ, string descr, float price)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            int result = 0;
            try
            {
                /*@nameItem varchar(30), @restID int, 
                 @itemID int, @categ varchar(30), @itemdescr text, @priceItem float */
                cmd = new SqlCommand("updateMenu", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@itemID", SqlDbType.Int).Value = id;
                cmd.Parameters.Add("@nameItem", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("@categ", SqlDbType.VarChar).Value = categ;
                cmd.Parameters.Add("@itemdescr", SqlDbType.Text).Value = descr;
                cmd.Parameters.Add("@priceItem", SqlDbType.Float).Value = price;

                result = cmd.ExecuteNonQuery();
            }

            catch (SqlException ex)

            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }

            finally
            {
                con.Close();
            }

            return result;
        }

        public void AddMenuItem(string email, string name, string categ, string descr, float price, ref string error)
        {
            SqlConnection con = new SqlConnection(connString);
            int rows = 0;
            con.Open();
            SqlCommand idFetcher;
            SqlCommand cmd;
            try
            {
                idFetcher = new SqlCommand("SELECT rest_id FROM Restaurant WHERE rest_email = @Email", con);
                idFetcher.Parameters.AddWithValue("@Email", email);
                object result = idFetcher.ExecuteScalar();
                int restaurantID = Convert.ToInt32(result);

                cmd = new SqlCommand("Add_Menu_Item", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@restID", SqlDbType.Int).Value = restaurantID;
                cmd.Parameters.Add("@nameItem", SqlDbType.VarChar).Value = name;
                cmd.Parameters.Add("@categ", SqlDbType.VarChar).Value = categ;
                cmd.Parameters.Add("@descrItem", SqlDbType.Text).Value = descr;
                cmd.Parameters.Add("@priceItem", SqlDbType.Float).Value = price;

                rows = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (rows == 0 || rows == 0)
                {
                    error = "Could not add menu item";
                }
                con.Close();
            }

        }

        //------------------------------RESTAURANT'S ORDER FUNCTIONS
        public DataSet SelectOrders(string email, ref string errorIfApplicable)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand idFetcher;
            SqlCommand cmd;
            try
            {
                idFetcher = new SqlCommand("SELECT rest_id FROM Restaurant WHERE rest_email = @Email", con);
                idFetcher.Parameters.AddWithValue("@Email", email);
                object result = idFetcher.ExecuteScalar();
                int restaurantID = Convert.ToInt32(result);

                using (con)
                {
                    cmd = new SqlCommand("GetOrders", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@restID", restaurantID);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    errorIfApplicable = "No orders found for the restaurant.";
                }
                con.Close();
            }

            return ds;
        }

        public DataSet SelectOrderItems(string email, int orderid, ref string errorIfApplicable)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand idFetcher;
            SqlCommand cmd;
            try
            {
                idFetcher = new SqlCommand("SELECT rest_id FROM Restaurant WHERE rest_email = @Email", con);
                idFetcher.Parameters.AddWithValue("@Email", email);
                object result = idFetcher.ExecuteScalar();
                int restaurantID = Convert.ToInt32(result);

                using (con)
                {
                    cmd = new SqlCommand("GetOrderItems", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@order_id", orderid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    errorIfApplicable = "No items found for this order.";
                }
                con.Close();
            }

            return ds;
        }

        // ---------------------------------Get restaurant Menu
        public DataSet DisplayMenu(int customerID)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);

            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("GetRestaurantMenu", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@CustomerID", customerID); // Add customer ID parameter

                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(ds);
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return ds;
        }

        // -------------------------Add to Cart
        public string AddToCart(int custId, int menuId, int quantity)
        {
            string result = "";
            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("Add_To_Cart", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@p_cust_id", custId);
                        cmd.Parameters.AddWithValue("@p_menuID", menuId);
                        cmd.Parameters.AddWithValue("@p_quantity", quantity);
                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = "success";
                    }
                }
            }
            catch (Exception ex)
            {
                result = "An error occurred: " + ex.Message;
            }
            return result;
        }

        public float CalculateCartTotal(int custId)
        {
            float totalPrice = 0;

            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand("CalculateCartTotal", connection);
                command.CommandType = CommandType.StoredProcedure;
                command.Parameters.AddWithValue("@CustId", custId);
                object result = command.ExecuteScalar();
                if (result != null && result != DBNull.Value) // Check if the result is not null or DBNull
                {
                    totalPrice = Convert.ToSingle(result);
                }
            }

            return totalPrice;
        }
        // ------------------------------Display cart 
        public DataTable GetCartInfo(int custId)
        {
            DataTable dt = new DataTable();
            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetCartInfo", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Cust_id", custId);
                        con.Open();
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            da.Fill(dt);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error: " + ex.Message);
            }
            return dt;
        }
        // ------------------------------Delete from cart
        public void DeleteCart(int cartId)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand("deleteCart", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@ID", cartId);

                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public int UpdateItem(int cartNo, int uQuantity)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            int result = 0;
            try
            {
                cmd = new SqlCommand("UpdateItem", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Quantity", SqlDbType.Int).Value = uQuantity;
                cmd.Parameters.Add("@CartNo", SqlDbType.VarChar).Value = cartNo;
                result = cmd.ExecuteNonQuery();
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error" + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
            return result;
        }

        // ------------------------------Session info
        public object CustomerInfo(string email, string column)
        {
            object result = null;
            string query = $"SELECT {column} FROM Customer_Signup WHERE Cust_email = @Email";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        result = command.ExecuteScalar();

                        if (result != null && result != DBNull.Value)
                        {
                            if (column == "IntColumn")
                            {
                                result = Convert.ToInt32(result);
                            }
                            else if (column == "FloatColumn")
                            {
                                result = Convert.ToSingle(result);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error: " + ex.Message);
                    }
                }
            }

            return result;
        }
        public string PlaceOrder(int customerId, int restaurantId, float orderTotal)
        {
            string result = "";
            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("PlaceOrder", con)) // Assuming you have a stored procedure to insert orders
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@Cust_id", customerId);
                        cmd.Parameters.AddWithValue("@rest_id", restaurantId);
                        cmd.Parameters.AddWithValue("@order_total", orderTotal);
                        cmd.Parameters.AddWithValue("@order_status", "Pending"); // You can set the initial status as "Pending" or any other default value

                        con.Open();
                        cmd.ExecuteNonQuery();
                        result = "success";
                    }
                }
            }
            catch (Exception ex)
            {
                result = "An error occurred: " + ex.Message;
            }
            return result;
        }
        public DataTable GetCart(int customerId)
        {
            DataTable cartItems = new DataTable();
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                string query = "SELECT * FROM Cart WHERE Cust_id = @customerId";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@customerId", customerId);
                SqlDataAdapter adapter = new SqlDataAdapter(command);
                adapter.Fill(cartItems);
            }
            return cartItems;
        }
        public void ClearCart(int customerId)
        {
            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("DELETE FROM Cart WHERE Cust_id = @Cust_id", con))
                    {
                        cmd.Parameters.AddWithValue("@Cust_id", customerId);
                        con.Open();
                        cmd.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error: " + ex.Message);
            }
        }
        public int GetRestaurantId(int menuId)
        {
            int restaurantId = -1; // Default value if not found

            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT rest_id FROM Restaurant_Menu WHERE menu_id = @MenuId", con))
                    {
                        cmd.Parameters.AddWithValue("@MenuId", menuId);
                        con.Open();
                        var result = cmd.ExecuteScalar();
                        if (result != null && result != DBNull.Value)
                        {
                            restaurantId = Convert.ToInt32(result);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                Console.WriteLine("Error: " + ex.Message);
            }

            return restaurantId;
        }

        public int InsertOrder(float orderTotal, int customerId, int restaurantId, string orderStatus)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                string query = "INSERT INTO Orders (order_total, Cust_id, rider_id, rest_id, order_status) VALUES (@orderTotal, @customerId, @riderId, @restaurantId, @orderStatus); SELECT SCOPE_IDENTITY();";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@orderTotal", orderTotal);
                command.Parameters.AddWithValue("@customerId", customerId);
                int riderId = GetRandomRiderId(customerId); // Get a random rider ID
                command.Parameters.AddWithValue("@riderId", riderId);
                command.Parameters.AddWithValue("@restaurantId", restaurantId);
                command.Parameters.AddWithValue("@orderStatus", orderStatus);
                int orderId = Convert.ToInt32(command.ExecuteScalar());
                return orderId;
            }
        }

        public void InsertOrderItem(int orderId, int menuId, int quantity)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                connection.Open();
                string query = "INSERT INTO Order_Items (order_id, menu_id, item_qty) VALUES (@orderId, @menuId, @quantity);";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@orderId", orderId);
                command.Parameters.AddWithValue("@menuId", menuId);
                command.Parameters.AddWithValue("@quantity", quantity);
                command.ExecuteNonQuery();
            }
        }


        //-----------------------Get Random Rider
        public int GetRandomRiderId(int customerId)
        {
            int riderId = -1; // Default value if no rider found

            try
            {
                using (SqlConnection con = new SqlConnection(connString))
                {
                    using (SqlCommand cmd = new SqlCommand("GetRidersByCustomerLocation", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@CustID", customerId);
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        List<int> riderIds = new List<int>();

                        while (reader.Read())
                        {
                            int id = Convert.ToInt32(reader["rider_id"]);
                            riderIds.Add(id);
                        }

                        if (riderIds.Count > 0)
                        {
                            Random rand = new Random();
                            int randomIndex = rand.Next(0, riderIds.Count);
                            riderId = riderIds[randomIndex];
                        }

                        reader.Close();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error: " + ex.Message);
            }

            return riderId;
        }

        //-------------------------CUSTOMER'S ORDER HISTORY
        public DataSet SelectOrdersCustomers(string email, ref string errorIfApplicable)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand idFetcher;
            SqlCommand cmd;
            try
            {
                idFetcher = new SqlCommand("SELECT Cust_id FROM Customer_Signup WHERE Cust_email = @Email", con);
                idFetcher.Parameters.AddWithValue("@Email", email);
                object result = idFetcher.ExecuteScalar();
                int ID = Convert.ToInt32(result);

                using (con)
                {
                    cmd = new SqlCommand("GetOrdersCustomers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@custID", ID);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    errorIfApplicable = "No orders found.";
                }
                con.Close();
            }

            return ds;
        }

        public DataSet SelectOrderItemsCustomer(string email, int orderid, ref string errorIfApplicable)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {

                using (con)
                {
                    cmd = new SqlCommand("GetOrderItemsCustomers", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@orderID", orderid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    errorIfApplicable = "No items found for this order.";
                }
                con.Close();
            }

            return ds;
        }

        //------------------------------RIDER FUNCTIONS

        public object RiderInfo(string email, string column)
        {
            object result = null;
            string query = $"SELECT {column} FROM Rider_Signup WHERE rider_email = @Email";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Email", email);

                    try
                    {
                        connection.Open();
                        result = command.ExecuteScalar();

                        if (result != null && result != DBNull.Value)
                        {
                            if (column == "IntColumn")
                            {
                                result = Convert.ToInt32(result);
                            }
                            else if (column == "FloatColumn")
                            {
                                result = Convert.ToSingle(result);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("Error: " + ex.Message);
                    }
                }
            }

            return result;
        }
        public DataSet SelectRiderOrders(string email, ref string error)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand idFetcher;
            SqlCommand cmd;
            try
            {
                idFetcher = new SqlCommand("SELECT rider_id FROM Rider_Signup WHERE rider_email = @Email", con);
                idFetcher.Parameters.AddWithValue("@Email", email);
                object result = idFetcher.ExecuteScalar();
                int riderID = Convert.ToInt32(result);

                using (con)
                {
                    cmd = new SqlCommand("GetRiderOrders", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@riderID", riderID);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    error = "No orders found for the restaurant.";
                }
                con.Close();
            }

            return ds;
        }

        public void ConfirmDelivery(int orderId)
        {
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {
                cmd = new SqlCommand("UPDATE Orders SET order_status = 'Completed' WHERE order_id = @orderid", con);
                cmd.Parameters.AddWithValue("@orderid", orderId);
                cmd.ExecuteScalar();
            }
            catch (SqlException e)
            {
                Console.WriteLine("SQL Error " + e.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }

        public DataSet SelectOrderItemsRider(int orderid, ref string errorIfApplicable)
        {
            DataSet ds = new DataSet();
            SqlConnection con = new SqlConnection(connString);
            con.Open();
            SqlCommand cmd;
            try
            {

                using (con)
                {
                    cmd = new SqlCommand("GetOrderItems", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@order_id", orderid);

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        da.Fill(ds);
                    }
                }
            }
            catch (SqlException ex)
            {
                Console.WriteLine("SQL Error " + ex.Message.ToString());
            }
            finally
            {
                if (ds.Tables.Count == 0 || ds.Tables[0].Rows.Count == 0)
                {
                    errorIfApplicable = "No items found for this order.";
                }
                con.Close();
            }

            return ds;
        }

        //ADMIN RIDER FUNCTIONS//////
        public static DataTable GetAllRiders()
        {
            DataTable dt = new DataTable();
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM Rider_Signup", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
            }
            return dt;
        }

        public static void DeleteRider(int riderId)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM Rider_Signup WHERE rider_id = @riderId", conn);
                cmd.Parameters.AddWithValue("@riderId", riderId);
                cmd.ExecuteNonQuery();
            }
        }

        public static void GiveSalary(int riderId, decimal salaryAmount)
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE Rider_Signup SET rider_balance = rider_balance + @salaryAmount WHERE rider_id = @riderId", conn);
                cmd.Parameters.AddWithValue("@riderId", riderId);
                cmd.Parameters.AddWithValue("@salaryAmount", salaryAmount);
                cmd.ExecuteNonQuery();
            }
        }




        //ADMIN CUSTOMER FUNCTIONSSS
        public static List<Customer> GetCustomers()
        {
            List<Customer> customers = new List<Customer>();

            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Customer_Signup";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Customer customer = new Customer();
                        customer.Cust_id = Convert.ToInt32(reader["Cust_id"]);
                        customer.Cust_Name = reader["Cust_Name"].ToString();
                        customer.Cust_email = reader["Cust_email"].ToString();
                        customer.Cust_password = reader["Cust_password"].ToString();
                        customer.Cust_phone = reader["Cust_phone"].ToString();
                        customer.Cust_location = reader["Cust_location"].ToString();
                        customers.Add(customer);
                    }
                }
            }

            return customers;
        }

        public static void DeleteCustomer(int customerId)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "DELETE FROM Customer_Signup WHERE Cust_id = @CustomerId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CustomerId", customerId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

        public static void UpdateCustomer(Customer customer)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "UPDATE Customer_Signup SET Cust_Name = @CustName, Cust_email = @CustEmail, Cust_password = @CustPassword, Cust_phone = @CustPhone, Cust_location = @CustLocation WHERE Cust_id = @CustomerId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.Add("@CustName", SqlDbType.VarChar).Value = customer.Cust_Name;
                    command.Parameters.Add("@CustEmail", SqlDbType.VarChar).Value = customer.Cust_email;
                    command.Parameters.Add("@CustPassword", SqlDbType.VarChar).Value = customer.Cust_password;
                    command.Parameters.Add("@CustPhone", SqlDbType.VarChar).Value = customer.Cust_phone;
                    command.Parameters.Add("@CustLocation", SqlDbType.VarChar).Value = customer.Cust_location;
                    command.Parameters.Add("@CustomerId", SqlDbType.Int).Value = customer.Cust_id;
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
        //ADMIN RESTAURANTS
        public static List<Restaurant> GetRestaurants()
        {
            List<Restaurant> restaurants = new List<Restaurant>();

            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "SELECT * FROM Restaurant";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    while (reader.Read())
                    {
                        Restaurant restaurant = new Restaurant();
                        restaurant.Rest_id = Convert.ToInt32(reader["rest_id"]);
                        restaurant.Rest_name = reader["rest_name"].ToString();
                        restaurant.Rest_password = reader["rest_password"].ToString();
                        restaurant.Rest_description = reader["rest_description"].ToString();
                        restaurant.Rest_location = reader["rest_location"].ToString();
                        restaurant.Rest_email = reader["rest_email"].ToString();
                        restaurant.Sales_tax = Convert.ToSingle(reader["sales_tax"]);
                        restaurant.Order_lead_time = Convert.ToInt32(reader["order_lead_time"]);
                        restaurant.Delivery_extra_time = Convert.ToInt32(reader["delivery_extra_time"]);
                        restaurants.Add(restaurant);
                    }
                }
            }

            return restaurants;
        }

        public static void UpdateRestaurant(int restaurantId, string name, string location, string email)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "UPDATE Restaurant SET rest_name = @RestName, rest_location = @RestLocation, rest_email = @RestEmail WHERE rest_id = @RestaurantId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@RestName", name);
                    command.Parameters.AddWithValue("@RestLocation", location);
                    command.Parameters.AddWithValue("@RestEmail", email);
                    command.Parameters.AddWithValue("@RestaurantId", restaurantId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }
        public static void DeleteRestaurant(int restaurantId)
        {
            using (SqlConnection connection = new SqlConnection(connString))
            {
                string query = "DELETE FROM Restaurant WHERE rest_id = @RestaurantId";
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@RestaurantId", restaurantId);
                    connection.Open();
                    command.ExecuteNonQuery();
                }
            }
        }

    }

    
}