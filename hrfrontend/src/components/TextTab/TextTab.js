import React from "react";
import PropTypes from 'prop-types';

import "./TextTab.css";

function TextTab({ sno, name, employeeID, motivation, relationships, feedback, alignment, wellness, overallFeeling }) {
  return (
    <div className="outer-border">
      <div className="text-tab">
        <div className="sno">{sno}</div>
        <div className="content">
          <div className="information">
            <div className="name">{sno == 1 ? "Employee1" : "Employee2"}</div>
            <div className="percentage-tab">
              <div className="motivation">Employee ID:</div>
              <div className="value">000{employeeID}</div>
            </div>
            <div className="percentage-tab">
              <div className="motivation">Motivation</div>
              <div className="value">{motivation*10}%</div>
            </div>
            <div className="percentage-tab">
              <div className="motivation">Relationships</div>
              <div className="value">{relationships*10}%</div>
            </div>
            <div className="percentage-tab">
              <div className="motivation">Feedback</div>
              <div className="value">{feedback*10}%</div>
            </div>
            <div className="percentage-tab">
              <div className="motivation">Alignment</div>
              <div className="value">{alignment*10}%</div>
            </div>
            <div className="percentage-tab">
              <div className="motivation">Wellness</div>
              <div className="value">{wellness*10}%</div>
            </div>
          </div>
          <div className="state">Overall Feeling: {overallFeeling}</div>
        </div>
      </div>
    </div>
  );
}

TextTab.propTypes = {
  sno: PropTypes.number.isRequired,
  name: PropTypes.string.isRequired,
  employeeID: PropTypes.string.isRequired,
  motivation: PropTypes.number.isRequired,
  relationships: PropTypes.number.isRequired,
  feedback: PropTypes.number.isRequired,
  alignment: PropTypes.number.isRequired,
  wellness: PropTypes.number.isRequired,
  overallFeeling: PropTypes.string.isRequired,
};

export default TextTab;
