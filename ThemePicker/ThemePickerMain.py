import sys
import os
import subprocess
from PyQt6.QtWidgets import (
    QApplication, QWidget, QPushButton, QHBoxLayout, QLabel, QVBoxLayout
)
from PyQt6.QtCore import Qt, QRectF
from PyQt6.QtGui import QColor, QPainter, QBrush, QPainterPath, QIcon



class ThemeSelector(QWidget):
    def __init__(self):
        super().__init__()

        self.setWindowTitle("Choosee")
        self.setGeometry(300, 300, 1920, 400)
        self.setWindowFlags(Qt.WindowType.FramelessWindowHint | Qt.WindowType.WindowStaysOnTopHint)
        self.setAttribute(Qt.WidgetAttribute.WA_TranslucentBackground)

        self.main_layout = QHBoxLayout(self)
        self.main_layout.setContentsMargins(50, 50, 50, 50)
        self.main_layout.setSpacing(10)


        self.add_theme_row("beige", os.path.expanduser("~/.config/ThemePicker/guipython/ladycrop.png"))
        self.add_theme_row("gray", os.path.expanduser("~/.config/ThemePicker/guipython/graycrop.png"))
        self.add_theme_row("nord", os.path.expanduser("~/.config/ThemePicker/guipython/nordcrop.png"))
    

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
                border: 7px inset #4c566a
;
            }}
        """)

        btn.clicked.connect(lambda _, t=theme_name: self.set_theme(t))
            

        label = QLabel(theme_name.upper())
        label.setStyleSheet("color:#d8dee9; font-size:19px; font-family: 'JetBrainsMono Nerd Font Mono';")
        label.setAlignment(Qt.AlignmentFlag.AlignVCenter)

        theme_layout.addWidget(btn)
        theme_layout.addWidget(label)
    
        self.main_layout.addLayout(theme_layout)

    def set_theme(self, theme_name):
        try:
            script_path = os.path.expanduser("~/.config/ThemePicker/scripts/themepicker.sh")

            subprocess.Popen([script_path, theme_name])
            # hay que hacer un not puush print(f"theme cambio a {theme_name}")
            self.close()
        except  FileNotFoundError:
            print(f"no hay tal cosa")



    def paintEvent(self, event):
        painter = QPainter(self)
        painter.setRenderHint(QPainter.RenderHint.Antialiasing)
        brush = QBrush(QColor(46, 52, 64, 30))
        rect = QRectF(self.rect())
        path = QPainterPath()
        path.addRoundedRect(rect, 10, 10)
        painter.fillPath(path, brush)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    win = ThemeSelector()
    win.show()
    sys.exit(app.exec())