import { useState } from "react";
import React from "react";
import "./InvociePage.css"
// import InvoiceGrid from "../../components/InvoiceGrid/InvoiceGrid";
// import AdvanceInvoiceGrid from "../../components/AdvancedGrid/AdvanceGrid";

function InvoicePage() {
  const [billNumber, setBillNumber] = useState(0);
  return (
    <div className="invoice-page">
      <div className="invoice-page-left">
        <div className="company-name">HR Genius</div>
        <div className="client-name">
          <p className="client-name">ComanyName</p>
          <p className="client-location">Pilani</p>
          <p className="status">(Admin)</p>
        </div>
      </div>
      <div className="invoice-page-right">
        <div className="my-bills">All Employees</div>
       


      </div>
    </div>
  );
}

export default InvoicePage;
