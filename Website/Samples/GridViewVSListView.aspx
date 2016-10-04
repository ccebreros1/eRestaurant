<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="GridViewVSListView.aspx.cs" Inherits="Samples_GridViewVSListView" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:Label ID="GridViewPOCO" runat="server" Text="Grid View POCO"></asp:Label>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="true"></asp:GridView>
    <asp:ObjectDataSource ID="GridviewODS" runat="server"></asp:ObjectDataSource>
</asp:Content>

