import { useState } from "react";
import React from "react";
import "./InvociePage.css"
import TextTab from "../../components/TextTab/TextTab";

function InvoicePage() {
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
        <TextTab/>
        <TextTab/>
        <TextTab/>
        <TextTab/>
        <TextTab/>
        <TextTab/>
       


      </div>
    </div>
  );
}

export default InvoicePage;
