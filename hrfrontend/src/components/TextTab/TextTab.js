import React, { useState } from "react";

import "./TextTab.css";

function TextTab() {
  return (
    <div className="outer-border"><div className="text-tab">
    <div className="sno">1</div>
    <div className="content">
      <div className="information">
        <div className="name">Shreyan P.</div>
        <div className="percentage-tab">
          <div className="motivation">Employee ID:</div>
          <div className="value">0002</div>
        </div>

        <div className="percentage-tab">
          <div className="motivation">Motivation</div>
          <div className="value">80%</div>
        </div>
        <div className="percentage-tab">
          <div className="motivation">Relationships</div>
          <div className="value">80%</div>
        </div>
        <div className="percentage-tab">
          <div className="motivation">Feedback</div>
          <div className="value">80%</div>
        </div>
        <div className="percentage-tab">
          <div className="motivation">Alignment</div>
          <div className="value">80%</div>
        </div>
        <div className="percentage-tab">
          <div className="motivation">Wellness</div>
          <div className="value">80%</div>
        </div>
      </div>
      <div className="state">Overall Feeling: Happy</div>
    </div>
  </div></div>
    
  );
}

export default TextTab;
