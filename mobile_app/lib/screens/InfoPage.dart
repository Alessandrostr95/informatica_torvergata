import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);
  static String PAGE_ROUTE = "/info";

  @override
  Widget build(BuildContext context) {
    const _style1 =
        TextStyle(fontFamily: "monospace", color: Colors.black, fontSize: 18);
    const _style2 = TextStyle(fontWeight: FontWeight.bold);
    const _style3 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20);
    const _style4 = TextStyle(fontStyle: FontStyle.italic);
    const _divider = Divider(color: Colors.black, thickness: 1);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Introduzione",
                      style: TextStyle(
                          fontFamily: "monospace",
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(
                        text:
                            "A tutti noi capita di lamentarci di qualcosa. Questo è normale. Anzi, è fondamentale sentire ed esprimere la propria insoddisfazione, in quanto l'umanità è sempre avanzata in eterni conflitti tra "),
                    TextSpan(text: "realtà insoddisfacenti", style: _style2),
                    TextSpan(text: " e "),
                    TextSpan(
                        text: "ideali irraggiungibili.\n\n", style: _style2),
                    TextSpan(
                      text:
                          "Questa applicazione nasce da una serie di critiche e da un senso di insoddisfazione generale rispetto allo stato corrente del sito di informatica. Il nostro obiettivo è alquanto semplice da esprimere:\n\n",
                      style: _style1,
                    ),
                    TextSpan(
                        text:
                            "fornire un servizio alternativo al sito ufficiale di informatica\n\n",
                        style: _style3),
                    TextSpan(text: "Noi siamo studenti di "),
                    TextSpan(text: "informatica", style: _style4),
                    TextSpan(
                        text:
                            ", e come tali non ci possiamo fermare alle critiche sullo stato dei servizi tecnologici che siamo costretti ad utilizzare. Per anni abbiamo studiato e sviluppato gli strumenti base dell'informatico. Adesso dobbiamo onorare la nostra educazione e professione, utilizzando ciò che abbiamo imparato per "),
                    TextSpan(
                        text: "migliorare lo stato delle cose.\n\n",
                        style: _style2),
                    TextSpan(
                        text:
                            "Cosa rende il nostro servizio unico nel suo genere? Il nostro servizio è stato concepito fin dalla sua nascita per essere fatto\n\n"),
                    TextSpan(
                        text: "dagli studenti, per gli studenti.",
                        style: _style3)
                  ])),

                  // ==========================================
                  // ==========================================
                  _divider,
                  // ==========================================
                  // ==========================================

                  const Text("Informazioni sull'applicazione",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "monospace",
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(
                        text:
                            "Per lo sviluppo di questa applicazione sono state coinvolte differenti tecnologie e linguaggi.\n\n"),
                    TextSpan(
                        text:
                            "Innanzitutto, l'applicazione mobile è stata interamente sviluppata in linugaggio "),
                    TextSpan(text: "Dart ", style: _style2),
                    TextSpan(
                        text: " e con l'ausilio dell'innovativa tecnologia "),
                    TextSpan(text: "Flutter.", style: _style2),
                  ])),
                  _getImage("assets/images/dart_logo.png",
                      MediaQuery.of(context).size.width * 0.3),
                  const Text(
                    "Dart è un linguaggio di programmazione object-oriented completamente open source e sviluppato da Google.",
                    style: _style1,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: FlutterLogo(
                        size: MediaQuery.of(context).size.width * 0.3),
                  ),
                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(
                        text:
                            "Flutter è un framework open-source creato da Google per la creazione di interfacce native per "),
                    TextSpan(text: "iOS e Android", style: _style2),
                    TextSpan(
                        text:
                            ", oltre ad essere il metodo principale per la creazione di applicazioni per "),
                    TextSpan(text: "Google Fuchsia.\n\n", style: _style2),
                    TextSpan(
                        text:
                            "Con Flutter è quindi possibile, con un singolo codice, scrive applicazioni grafiche eseguibili su smartphone (iOS e Android), su descktop (Linux, MacOs e Windows) e da browser.")
                  ])),
                  _getImage("assets/images/dart_side.jpg",
                      MediaQuery.of(context).size.width),
                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(
                        text:
                            "Come si può notare, l'appicazione è quasi interamente "),
                    TextSpan(text: '"single-page"', style: _style2),
                    TextSpan(
                        text:
                            ", ovvero le pagine principali sono mostrate in un'unica "),
                    TextSpan(text: "activity. ", style: _style4),
                    TextSpan(
                        text:
                            "Ciò comporta delle ulteriori difficoltà non indifferenti, in quanti si necessita di gestire "),
                    TextSpan(text: "contemporaneamente", style: _style2),
                    TextSpan(
                        text:
                            " più alberi degli stati, gestendo un unico contesto condiviso.\n\n"),
                    TextSpan(
                        text:
                            "Per la gestione di stati condivisi dai diversi alberi, sono state usate delle varianti del design pattern "),
                    TextSpan(text: "Observer.\n\n", style: _style2),
                    TextSpan(
                        text:
                            "Ogni volta che una di queste variabili osservate cambia stato in seguito all'interazione dell'utente, oppure in seguito ad una risposta di una richiesta al "),
                    TextSpan(text: "server", style: _style2),
                    TextSpan(
                        text:
                            ", ognuno degli osservatori 'intercetta' questo cambiamento di stato, e modifica rispettivamente il suo stato.")
                  ])),
                  _getImage("assets/images/bloc.png",
                      MediaQuery.of(context).size.width * 0.3),
                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(text: "BLoC", style: _style2),
                    TextSpan(
                        text:
                            " è il pattern più usato per aggiornare le pagine dopo il retrieving delle informazioni dal server.\n\n"),
                    TextSpan(
                        text:
                            "Riguardo quest'ultimo punto, è stato sviluppato un web server che espone delle "),
                    TextSpan(text: "API RESTfull", style: _style2),
                    TextSpan(
                        text:
                            " che forniscono tutte le informazioni utili mostrate nell'app.\n\n"),
                    TextSpan(
                        text:
                            "Il server è stato interamente sviluppato in linugaggio "),
                    TextSpan(text: "Go", style: _style2)
                  ])),
                  _getImage("assets/images/go_logo.png",
                      MediaQuery.of(context).size.width * 0.6),

                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(
                        text:
                            "un linguaggio di programmazione open source sviluppato da Google con l'intento di avere un compilazione efficiente (come C), di essere facile e veloce da usare (come Python o Javascript) e con alte performace.\n\n"),
                    TextSpan(
                        text:
                            "I dati nel server sono invece strutturati e preverservati in un "),
                    TextSpan(
                        text: "Base di Dati Strutturata MYSQL.", style: _style2)
                  ])),

                  // ==========================================
                  // ==========================================
                  _divider,
                  // ==========================================
                  // ==========================================

                  const Text("Perché quel logo?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "monospace",
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),
                  _getImage("assets/images/ppp.png",
                      MediaQuery.of(context).size.width * 0.6),

                  RichText(
                      text: TextSpan(style: _style1, children: [
                    const TextSpan(text: "Bene, se visiti il "),
                    TextSpan(
                        text: "sito ufficiale",
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch(
                              "http://www.informatica.uniroma2.it/",
                              forceWebView: false,
                              forceSafariVC: false)),
                    const TextSpan(
                        text:
                            ", noterai nella home page l'immagine di un albero. Se per puro caso non dovesse funzionare il sito (cosa che non accade mai), ecco qui l'immagine"),
                  ])),

                  _getImage("assets/images/albero.jpg",
                      MediaQuery.of(context).size.width * 0.5),

                  RichText(
                      text: const TextSpan(style: _style1, children: [
                    TextSpan(text: "Questo è un famoso quadro di "),
                    TextSpan(text: "Vincent van Gogh", style: _style2),
                    TextSpan(text: ", intitolato "),
                    TextSpan(text: '"The Pink Peach Tree"', style: _style2),
                    TextSpan(
                        text: ", raffigurante (manco a farlo apposta) un "),
                    TextSpan(text: "Pesco in Fiore.\n\n", style: _style2),
                    TextSpan(
                        text:
                            "Perciò, esattamente come la pesca è il frutto dell'albero di pesco, noi studenti siamo il frutto del nostro corso.",
                        style: _style3)
                  ])),

                  // ==========================================
                  // ==========================================
                  _divider,
                  // ==========================================
                  // ==========================================

                  const Text("Sviluppatori",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "monospace",
                          fontWeight: FontWeight.bold,
                          fontSize: 28)),

                  RichText(
                      text: TextSpan(style: _style1, children: [
                    const TextSpan(
                        text: "\u2022 Applicazione mobile: ", style: _style2),
                    TextSpan(
                        text: "Alessandro Straziota\n\n",
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch("http://95.179.136.254/",
                              forceWebView: false, forceSafariVC: false)),
                    const TextSpan(text: "\u2022 Web Server: ", style: _style2),
                    TextSpan(
                        text: "Alessandro Straziota\n\n",
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch("http://95.179.136.254/",
                              forceWebView: false, forceSafariVC: false)),
                    const TextSpan(text: "\u2022 Data Base: ", style: _style2),
                    TextSpan(
                        text: "Alessandro Straziota\n\n",
                        style: const TextStyle(
                            color: Colors.blue,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => launch("http://95.179.136.254/",
                              forceWebView: false, forceSafariVC: false)),
                  ]))
                ],
              )),
        ),
      ),
    );
  }

  Widget _getImage(String asset, double size) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: SizedBox(
        width: size,
        child: Image.asset(
          asset,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
