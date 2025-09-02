import sys
import os
import subprocess
from PyQt6.QtWidgets import (
    QApplication, QWidget, QPushButton, QHBoxLayout, QLabel, QVBoxLayout, QScrollArea
)
from PyQt6.QtCore import Qt, QRectF
from PyQt6.QtGui import QColor, QPainter, QBrush, QPainterPath, QIcon

class ThemeSelector(QWidget):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Choosee")
        self.setGeometry(300, 300, 1920, 600)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint | Qt.WindowType.WindowStaysOnTopHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        # Ensure no default background is applied
        self.setStyleSheet("background: transparent;")

        # Create the main layout for the window
        main_layout = QVBoxLayout(self)
        main_layout.setContentsMargins(0, 0, 0, 0)  # Remove margins to avoid gaps

        # Create a scroll area
        scroll_area = QScrollArea()
        scroll_area.setWidgetResizable(True)
        scroll_area.setStyleSheet("""
            QScrollArea {
                border: none;
                background: transparent;
            }
            QScrollBar:horizontal {
                height: 15px;
                background: #2e3440;
                border-radius: 7px;
            }
            QScrollBar::handle:horizontal {
                background: #4c566a;
                border-radius: 7px;
            }
            QScrollBar::add-line:horizontal, QScrollBar::sub-line:horizontal {
                background: none;
            }
        """)
        # Disable vertical scrollbar
        scroll_area.setVerticalScrollBarPolicy(Qt.ScrollBarPolicy.ScrollBarAlwaysOff)
        # Enable horizontal scrollbar
        scroll_area.setHorizontalScrollBarPolicy(Qt.ScrollBarPolicy.ScrollBarAsNeeded)

        # Create a widget to hold the theme buttons
        scroll_widget = QWidget()
        scroll_widget.setStyleSheet("background: transparent;")  # Ensure transparent background
        self.main_layout = QHBoxLayout(scroll_widget)
        self.main_layout.setContentsMargins(50, 50, 50, 50)
        self.main_layout.setSpacing(10)

        # Add theme rows to the scrollable widget
        self.add_theme_row("beige", os.path.expanduser("~/.config/ThemePicker/guipython/ladycrop.png"))
        self.add_theme_row("gray", os.path.expanduser("~/.config/ThemePicker/guipython/graycrop.png"))
        self.add_theme_row("nord", os.path.expanduser("~/.config/ThemePicker/guipython/nordcrop.png"))
        self.add_theme_row("Chicago-95", os.path.expanduser("~/.config/ThemePicker/guipython/chicagocrop.png"))

        # Set the scroll widget as the scroll area's widget
        scroll_area.setWidget(scroll_widget)

        # Ensure the scroll widget's height fits the scroll area to avoid vertical scrolling
        scroll_widget.setFixedHeight(520 + 60)  # Button height (520) + margins (50+50)

        # Add the scroll area to the main layout
        main_layout.addWidget(scroll_area)

    def add_theme_row(self, theme_name, image_path):
        theme_layout = QHBoxLayout()

        btn = QPushButton()
        btn.setFixedSize(405, 520)
        btn.setStyleSheet(f"""
            QPushButton {{ 
                border: 8px outset #2e3440;
                border-radius: 95px;
                background-image: url("{image_path}");
                background-position: center; 
                background-repeat: no-repeat;
                background-size: cover;
            }}
            QPushButton:hover {{
                border: 7px inset #4c566a;
            }}
        """)

        btn.clicked.connect(lambda _, t=theme_name: self.set_theme(t))
            
        label = QLabel(theme_name.upper())
        label.setStyleSheet("color:#d8dee9; font-size:19px; font-family: 'JetBrainsMono Nerd Font Mono';")
        label.setAlignment(Qt.AlignmentFlag.AlignVCenter)
        label.setMargin(20) 
    
        theme_layout.addWidget(btn)
        theme_layout.addWidget(label)
    
        self.main_layout.addLayout(theme_layout)

    def set_theme(self, theme_name):
        try:
            script_path = os.path.expanduser("~/.config/ThemePicker/scripts/themepickerch.sh")
            subprocess.Popen([script_path, theme_name])
            self.close()
        except FileNotFoundError:
            print(f"no hay tal cosa")

    def paintEvent(self, event):
        painter = QPainter(self)
        painter.setRenderHint(QPainter.RenderHint.Antialiasing)
        brush = QBrush(QColor(46, 52, 64, 30))  # Semi-transparent fill
        rect = QRectF(self.rect())  # Use full window rectangle
        path = QPainterPath()
        path.addRoundedRect(rect, 10, 10)
        painter.fillPath(path, brush)
        painter.end()  # Explicitly end painting to avoid issues

if __name__ == "__main__":
    app = QApplication(sys.argv)
    app.setStyle("Fusion")  # Use Fusion style to ensure consistent rendering
    win = ThemeSelector()
    win.show()
    sys.exit(app.exec())