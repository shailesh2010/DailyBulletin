<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="changepassword.aspx.cs" Inherits="changepassword" %>

<asp:Content ID="nav" ContentPlaceHolderID="navigation" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="form">
    
        
        <br />
    
        <asp:Label ID="Label4" runat="server" BackColor="#dc0000" ForeColor="White" Font-Bold="true" Font-Size="XX-Large" ></asp:Label>
        <br />
        <br />
    
        <asp:Label ID="Label1" runat="server" Text="password"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox1" runat="server" TextMode="Password"></asp:TextBox>    

        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="password required" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
          <br />
        <asp:Label ID="Label2" runat="server" Text="new password"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="new password required" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
          <br />
        <asp:Label ID="Label3" runat="server" Text="Retype new password"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="retype new password " ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="type same password" ControlToValidate="TextBox3" ControlToCompare="TextBox2"></asp:CompareValidator>
          <br />
        <asp:Button ID="Button1" runat="server" Text="change" onclick="Button1_Click" />
        <br />
        <br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Visible="false" NavigateUrl="~/Default.aspx">Login </asp:HyperLink>
    &nbsp;&nbsp;
        <asp:HyperLink ID="HyperLink2" runat="server">back</asp:HyperLink>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>

