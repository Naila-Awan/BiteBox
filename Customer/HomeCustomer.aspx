<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/BiteBoxCustomer.Master" AutoEventWireup="true" CodeBehind="HomeCustomer.aspx.cs" Inherits="BiteBox.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="../Styles/Home.css" rel="stylesheet" />
    <div class="innerContainer">
        <div>
            <img src="..\Images\GirlEating.png" alt="Description of the image" class="girlimg" />
        </div>
        <p class="biteboxtxt">BiteBox</p>
        <p class="qualitytxt">Quality</p>
        <p class="foodtxt">Food</p>
        <p class="deliverytxt">Delivery</p>
        <p class="towntxt">in Town</p>
        <p class="fillertxt">We will deliver your food within 30 minutes in your town,<br />If we fail, your food will be free! Start browsing right now!</p>
        <a class="loginbtn">Browse Restaurants</a>
    </div>
    <div class="aboutUsContainer">
        <br /><br />
        <p class="meettxt">Meet the Team!</p>
        <div class="teamimg">
            <div class="hissanContainer">
                <img src="..\Images\hissan.png" class="hissanimg" />
                <p class="nametxt">Hissan Butt</p>
                <a href="http://www.linkedin.com/in/hissan-butt" class="linkedinbtn" ><img src="..\Images\LinkedIn.png" class="linkedinimg" /></a>
                <a href="https://github.com/Hissan-2002" class="githubbtn"><img src="..\Images\Github.png" class="githubimg" /></a>
            </div>
            <div class="nailaContainer">
                <img src="..\Images\Naila.png" class="nailaimg" />
                <p class="nametxt">Naila Awan</p>
                <a href="https://www.linkedin.com/in/naila-awan-544718250/" class="linkedinbtn"><img src="..\Images\LinkedIn.png" class="linkedinimg" /></a>
                <a href="https://github.com/Naila-Awan" class="githubbtn"><img src="..\Images\Github.png" class="githubimg" /></a>

            </div>
            <div class="laibaContainer">
                <img src="..\Images\Laiba.png" class="laibaimg" />
                <p class="nametxt">Laiba Ijaz</p>
                <a href="https://www.linkedin.com/in/laiba-i-826b54139/" class="linkedinbtn"><img src="..\Images\LinkedIn.png" class="linkedinimg" /></a>
                <a href="https://github.com/lai-jaz" class="githubbtn"><img src="..\Images\Github.png" class="githubimg" /></a>
            </div>
        </div>
    </div>
</asp:Content>
