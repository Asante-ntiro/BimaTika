import { faCamera } from "@fortawesome/free-solid-svg-icons";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import React, { useState } from "react";
import { QrReader } from "react-qr-reader";
import "./Layout.css";
import profileImage from "../assets/profile.jpg";

function Layout() {
  const Users = [
    {
      id: 1,
      heading: "Scanner",
      text: "Scan a QR code here  to redeem your tokens.",
      icon: <FontAwesomeIcon icon={faCamera} id="icon" />,
      action: <QrReader scanDelay={300} legacyMode={false} />,
    },
    {
      id: 2,
      heading: "Hi user",
      text: "Your token balance is 124",
    },
  ];

  const [selected, setSelected] = useState(0);

  const earnToken = () => {
    {
      selected === 0 ? setSelected(0) : setSelected(0);
    }
  };

  function showToken() {
    selected === 1 ? setSelected(1) : setSelected(1);
  }

  return (
    <div className="profile">
      <div className="profile-post">
        <h2>Profile</h2>

        <div className="image-container">
          <img className="image" src={profileImage} alt="profile-image" />
          <h2>Victoria Robertson</h2>
        </div>
        <div className="bar">
          <button className="btn1" onClick={earnToken}>
            Earn Token
          </button>
          <button className="btn2" onClick={showToken}>
            Token Balance
          </button>
        </div>
        <div className="hero">
          <h3>{Users[selected].heading}</h3>
          <p>{Users[selected].text}</p>
          <p>{Users[selected].icon}</p>
          <p>{Users[selected].action}</p>
        </div>
      </div>
    </div>
  );
}

export default Layout;
