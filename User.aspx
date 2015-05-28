<%@ Page Title="" Language="C#" MasterPageFile="~/mainpage.master" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<asp:Content ID="nav" ContentPlaceHolderID="navigation" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript">
    window.onload = function () {
        noBack();
    }
    function noBack() {
        window.history.forward();
    }
</script>
<body>
 <div id="form" >
       <div style="text-align:center">
        <asp:Label ID="Label1" runat="server" BackColor="Red" ForeColor="White" Font-Size="X-Large"  
            Height="39px" Width="635px" ></asp:Label>
            </div>
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <br />
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="Button1" runat="server" Text="report news " 
            onclick="Button1_Click" CausesValidation="False" Width="146px" 
            BackColor="Red" ForeColor="White" Height="37px" />

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        
        <asp:Panel ID="Panel1" runat="server" Visible="false" Height="323px">      
    
            <table style="width: 100%">
                <tr>
                    <td style="width: 267px">
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="FileUpload1" ErrorMessage="upload an image"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        <asp:FileUpload ID="FileUpload2" runat="server" />
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="FileUpload2" ErrorMessage="upload second image"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        <asp:Label ID="Label4" runat="server"></asp:Label>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        <asp:Label ID="Label7" runat="server" Text="enter news header here"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine" Width="354px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        <asp:Label ID="Label2" runat="server" Text="enter news here"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" TextMode="MultiLine" Height="100px" 
                            Width="354px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="text is required"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        &nbsp;</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            onselectedindexchanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>National</asp:ListItem>
                            <asp:ListItem>International</asp:ListItem>
                            <asp:ListItem>Sports</asp:ListItem>
                            <asp:ListItem>Politics</asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="Button7" runat="server" BackColor="Red" ForeColor="White" 
                            Height="25px" onclick="Button2_Click" Text="submit news" Width="114px" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 267px">
                        
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
    
        <br />
        <br />
        &nbsp;<br />&nbsp;<br /><br />
            &nbsp;<br /><br />&nbsp;
            <br />
        <br />
        <br />      
        </asp:Panel>

<asp:Label ID="Label3" runat="server"></asp:Label>        <br />
        <br />


        <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
            Text="report complain" CausesValidation="False" Width="147px" 
            BackColor="Red" ForeColor="White" Height="36px" />
        
        <br />
       <br />
        
        <asp:Panel ID="Panel2" runat="server" Visible="false">
         <asp:Label ID="Label5" runat="server" Text="Enter Complain Here" ></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"   TextMode="MultiLine" Width="472px" ></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ErrorMessage="input complains"></asp:RequiredFieldValidator>
            <br />
            <asp:Button ID="Button5" runat="server" Text="submit complain"  
            onclick="Button5_Click" BackColor="Red" ForeColor="White" Height="26px" 
                style="margin-left: 263px" Width="111px" />
        <br />
        <br />
        </asp:Panel>
        
        <asp:Label ID="Label6" runat="server" ></asp:Label>

        <br />
        <br />
        <asp:Button ID="Button6" runat="server" onclick="Button6_Click" 
            Text="Change Password" CausesValidation="False" Width="146px" 
           BackColor="Red" ForeColor="White" Height="37px" />

        <br />
        <br />
        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="logout" 
            CausesValidation="false" Width="145px" BackColor="Red" ForeColor="White" 
           Height="37px"/>

        <br />
       
    </div>
    </body>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Login" Runat="Server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContetPlaceHolder5" Runat="Server">
</asp:Content>

