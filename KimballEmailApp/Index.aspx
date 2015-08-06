<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="KimballEmailApp.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>KEI Email App</title>
</head>
<body style="height: 594px; width: 1025px;">
    <form id="form1" runat="server">
    <div style="height: 596px; width: 1030px">
    
        <asp:Image ID="Logo" runat="server" Height="47px" ImageUrl="http://www.sec.gov/Archives/edgar/data/1606757/000160675714000049/keilogoonelinecolorcmyk2revi.jpg" Width="282px" />
    
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" Text="Email Test Tool"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="YourUserIDLabel" runat="server" Font-Bold="True" Font-Underline="True" Text="Your User ID:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="UserID" runat="server" Font-Bold="True" Text="USERID"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
        <asp:Label ID="Label1" runat="server" Font-Bold="True" Text="From:"></asp:Label>
&nbsp;
        <br />
        <asp:Label ID="FromAddressLabel" runat="server" BackColor="#A4E9FF" BorderStyle="Inset" Font-Bold="True" Text="Label"></asp:Label>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Font-Bold="True" Height="25px" Text="Note: Please separate multiple addresses with a single comma, no spaces."></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
        <asp:Label ID="ToLabel" runat="server" Font-Bold="True" Text="To:  "></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ValidityLabel" runat="server" Font-Bold="True" ForeColor="Red" Text="PLEASE ENTER A VALID EMAIL ADDRESS"></asp:Label>
        <br />
        <asp:TextBox ID="ToTextBox" runat="server" BackColor="#FF5555" Font-Names="Calibri" Font-Size="Medium" Height="20px" OnTextChanged="ToText_TextChanged" Width="1000px" AutoCompleteType="Email" AutoPostBack="True"></asp:TextBox>
        <br />
        <asp:Label ID="CCLabel" runat="server" Font-Bold="True" Text="CC:"></asp:Label>
        <br />
        <asp:TextBox ID="CCBox" runat="server" BackColor="#A4E9FF" Height="20px" Width="1000px" Font-Names="Calibri" Font-Size="Medium"></asp:TextBox>
        <br />
        <asp:Label ID="BCCLabel" runat="server" Font-Bold="True" Text="BCC:"></asp:Label>
        <br />
        <asp:TextBox ID="BCCBox" runat="server" BackColor="#A4E9FF" Height="20px" Width="1000px" Font-Names="Calibri" Font-Size="Medium"></asp:TextBox>
        <br />
    
        <asp:Label ID="SubjectLabel" runat="server" Font-Bold="True" Text="Subject:                                       "></asp:Label>
        <br />
        <asp:TextBox ID="SubjectTextBox" runat="server" BackColor="#A4E9FF" Font-Names="Calibri" Font-Size="Medium" Height="20px" TextMode="MultiLine" Width="1000px"></asp:TextBox>
        <br />
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Text="Attachment:"></asp:Label>
        <br />
        <asp:FileUpload ID="ChooseAttachment" runat="server" BackColor="#A4E9FF" Height="20px" Width="750px" />
        <br />
        <asp:Label ID="MessageLabel" runat="server" Font-Bold="True" Text="Message:" Height="25px"></asp:Label>
        <br />
        <asp:TextBox ID="MessageBodyTextBox" runat="server" BackColor="#A4E9FF" Font-Names="Calibri" Font-Size="Medium" Height="90px" TextMode="MultiLine" Width="1000px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="ChooseServerLabel" runat="server" Font-Bold="True" OnDataBinding="ClientSelection_SelectedIndexChanged" Text="Choose Server:"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ClientSelectionList" runat="server" BackColor="#A4E9FF" Font-Names="Calibri" Font-Size="Medium" Height="30px" Width="200px">
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="ErrorLabel" runat="server"></asp:Label>
        <br />
        <br />
    
        <asp:Button ID="SendButton" runat="server" BackColor="#A4E9FF" Font-Bold="True" ForeColor="Black" OnClick="SendButton_Click" Text="SEND" />
        <br />
            
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Version No.:"></asp:Label>
&nbsp;&nbsp;
        <asp:Label ID="VersionLabel" runat="server" Text="Label"></asp:Label>
            
    </div>
    </form>
</body>
</html>
