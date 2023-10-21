import { useState,useEffect } from "react";
import React from "react";
import "./InvociePage.css"
import TextTab from "../../components/TextTab/TextTab";

function InvoicePage() {
    const [outputs, setOutputs] = useState([]);
  
    useEffect(() => {
      fetch('https://hr-chatbot-3sh8.onrender.com/chatapp/form_outputs/')
        .then(response => response.json())
        .then(data => setOutputs(data))
        .catch(error => console.error('Error:', error));
    }, []);
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
        {outputs.map(user => (
        <TextTab
          key={user.id} // Make sure each component has a unique key
          sno={user.id}
          name={user.user}
          employeeID={user.user}
          motivation={user.answer1}
          relationships={user.answer2}
          feedback={user.answer3}
          alignment={user.answer4}
          wellness={user.answer5}
          overallFeeling={user.sentiment_output}
        />
      ))}
      
       


      </div>
    </div>
  );
}

export default InvoicePage;
