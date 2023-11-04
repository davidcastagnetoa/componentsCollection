# This Python file uses the following encoding: utf-8
import sys
import os
from PySide2.QtWidgets import QApplication, QMainWindow
from PySide2.QtQml import QQmlApplicationEngine


class main(QMainWindow):
    def __init__(self):
        QMainWindow.__init__(self)


if __name__ == "__main__":
    app = QApplication(sys.argv)
    engine = QQmlApplicationEngine()
    engine.load(os.path.join(os.path.dirname(__file__), "qml/main.qml"))
    # FUNCION PARA CERRAR VENTANA
    if not engine.rootObjects():
        sys.exit(-1)
    sys.exit(app.exec_())
