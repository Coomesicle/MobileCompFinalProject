import React, { useState } from 'react';
import './Dialog.css'; // Optional CSS for styling the dialog (create Dialog.css file)

const Dialog = ({ isOpen, onClose, children }) => {
  const [open, setOpen] = useState(isOpen);

  const handleClose = () => {
    setOpen(false);
    if (onClose) {
      onClose();
    }
  };

  // Update dialog visibility when isOpen prop changes
  React.useEffect(() => {
    setOpen(isOpen);
  }, [isOpen]);

  return (
    <>
      {open && (
        <div className="dialog-overlay">
          <div className="dialog-content">
            <button className="close-btn" onClick={handleClose}>
              &times;
            </button>
            {children}
          </div>
        </div>
      )}
    </>
  );
};

export default Dialog;
