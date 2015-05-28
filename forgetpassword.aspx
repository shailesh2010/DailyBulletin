<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="forgetpassword.aspx.cs" Inherits="forgetpassword" %>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
     
    <table  id="form"style="width: 100%">
        <tr>
            <td style="width: 236px">
                User Name</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Width="212px"></asp:TextBox><asp:RequiredFieldValidator
                    ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter user name" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

            </td>
        </tr>
        <tr>
            <td style="width: 236px">
                Select Security Question</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" Width="219px">
                    <asp:ListItem>What is your favourite color</asp:ListItem>
                    <asp:ListItem>What is your birth city</asp:ListItem>
                    <asp:ListItem>What is your hobby</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td style="width: 236px">
                enter your answer</td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Width="209px"></asp:TextBox>
                <br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ErrorMessage="enter your answer" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 236px">
                <asp:Button ID="Button1" runat="server" Text="Get Password" Width="175px" 
                    onclick="Button1_Click1" BackColor="Red" ForeColor="White" Height="30px" />
            </td>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
      
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>


