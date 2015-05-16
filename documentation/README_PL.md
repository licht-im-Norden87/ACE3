<p align="center">
    <img src="https://github.com/acemod/ACE3/blob/master/extras/assets/logo/black/ACE3-Logo.jpg"
         height="112">
</p>
<p align="center">
    <a href="https://github.com/acemod/ACE3/releases">
        <img src="http://img.shields.io/badge/Version-3.0.0-blue.svg?style=flat"
             alt="ACE version">
    </a>
    <a href="https://github.com/acemod/ACE3/archive/master.zip">
        <img src="http://img.shields.io/badge/Download-48.3_MB-green.svg?style=flat"
             alt="ACE download">
    </a>
    <a href="https://github.com/acemod/ACE3/issues">
        <img src="http://img.shields.io/github/issues-raw/acemod/ACE3.svg?style=flat&label=Issues"
             alt="ACE issues">
    </a>
    <a href="http://forums.bistudio.com/showthread.php?190433-ACE3-A-collaborative-merger-between-AGM-CSE-and-ACE&p=2910796&viewfull=1#post2910796">
        <img src="https://img.shields.io/badge/BIF-Thread-lightgrey.svg?style=flat"
             alt="BIF thread">
    </a>
    <a href="https://github.com/acemod/ACE3/blob/master/LICENSE">
        <img src="http://img.shields.io/badge/License-GPLv2-red.svg?style=flat"
             alt="ACE license">
    </a>
</p>
<p align="center"><sup><strong>Wymaga najnowszej wersji <a href="http://www.armaholic.com/page.php?id=18767">CBA A3</a>. Odwiedź nas na <a href="https://www.facebook.com/ACE3Mod">Facebook</a> | <a href="https://www.youtube.com/c/ACE3Mod">YouTube</a> | <a href="https://twitter.com/ACE3Mod">Twitter</a> | <a href="http://www.reddit.com/r/arma/search?q=ACE&restrict_sr=on&sort=new&t=all">Reddit</a></strong></sup></p>


**ACE3** to efekt wspólnego wysiłku grup moderów odpowiedzialnych za **ACE2**, **AGM** oraz **CSE** w celu zwiększenia realizmu i autentyczności Arma 3.

Projekt ten jest całkowicie **otwarty źródłowo** i wszelki wkład w rozwój jest mile widziany. Możesz bez przeszkód prowadzić swoją własną dostosowaną wersję, o ile zmiany jakie wprowadzisz będą otwarte dla publiki zgodnie z GNU General Public License ([GPLv2](https://github.com/acemod/ACE3/blob/master/LICENSE)).

Modyfikacja ta jest **budowana modułowo**, dzięki temu prawie każdy dostarczony plik PBO może zostać łatwo usunięty z konfiguracji. Dzięki temu, grupa może prowadzić własną, dostosowaną do siebie, wersję ACE wyłączając elementy, których nie potrzebują, lub które po prostu nie działają z innymi addonami. Moduły same w sobie np. system medyczny, posiadają wiele możliwości konfiguracji, pozwalając mission designerom dostosować ogólne doświadczenie z gry.

### Główne cechy
* Całkowicie nowy system akcji/interakcji 3D
* Wydajna i niezawodna struktura
* Skupienie na modułowości i customizacji
* Elastyczny system ustawień i konfiguracji opcji u klienta i serwera
* Ulepszony system medyczny z różnymi stopniami zaawansowania (podstawowy/rozszerzony) skupiony na grywalności i realizmowi
* Prawidłowa i spójna synchronizowana pogoda
* Balistyka oparta na warunkach pogodowych i wietrze
* Możliwość brania jeńców
* Rozszerzony system ładunków wybuchowych, włączając w to użycie różnego rodzaju zapalników
* Ulepszenia mapy - stawianie markerów i przybory mapy
* Zaawansowane naprowadzanie rakiet i wskazywanie laserem

#### Dodatkowe cechy
* Przeciąganie i przenoszenie
* Realistyczne nazwy pojazdów i broni
* System kontroli ognia (SKO) dla pojazdów opancerzonych oraz śmigłowców
* Realistyczna balistyka/SKO obliczana w rozszerzeniach C/C++
* Symulacja strefy backblastu i podciśnienia
* Jednorazowe wyrzutnie
* Realistyczne siły G
* Zamykanie pojazdów na kluczyk
* Realistyczne tryby termowizji oraz noktowizji
* Przepakowywanie magazynków
* Realistyczna mechanika przegrzewania broni
* Symulacja głuchoty bitewnej (tymczasowej utraty słuchu)
* Ulepszona fizyka ragdoll
* Ulepszona interakcja dla asystentów i amunicyjnych
* Regulowane celowniki snajperskie
* Usunięte animacje bezczynności z opuszczoną bronią
* Usunięte głosy awatara gracza
* Skakanie przez przeszkody, wspinanie się na ściany i przecinanie płotów
* Urządzenia Vector, MicroDAGR, Kestrel<br>
***i wiele wiele więcej...***

### Poradniki i instrukcje
Jeżeli zainstalowałeś ACE3 lecz masz problem ze zrozumieniem jak to wszystko działa, lub gdzie zacząć, zacznij od przeczytania tego:
* [Wprowadzenie](http://ace3mod.com/wiki/user/getting-started.html)

#### Współpraca
Możesz pomóc w rozwoju addonu szukając potencjalnych bugów w naszym kodzie, lub zgłaszając nowe funkcje. Aby wnieść swój wkład do ACE, po prostu zforkuj to repozytorium na swoje konto GitHub i zgłoś swoje pull requesty do przeglądu przez innych współpracowników. Pamiętaj, aby dodać siebie do listy autorów każdego PBO jakie edytujesz oraz do pliku ['AUTHORS.txt'](https://github.com/acemod/ACE3/blob/master/AUTHORS.txt) dodając także swój adres e-mail.

Używaj naszego [Issue Tracker-a](https://github.com/acemod/ACE3/issues) aby zgłaszać bugi, proponować nowe funkcje lub sugerować zmiany do aktualnie istniejących. Zobacz także:
* [Jak zgłosić bug-a](http://ace3mod.com/wiki/user/how-to-report-an-issue.html)
* [Jak zgłosić feature request-a](http://ace3mod.com/wiki/user/how-to-make-a-feature-request.html)

#### Testowanie i budowanie
Aby pomóc nam w testowaniu najnowszych zmian rozwojowych, pobierz nasz master branch ([bezpośrednio](https://github.com/acemod/ACE3/archive/master.zip), lub [korzystając z git](https://help.github.com/articles/fetching-a-remote/)), a następnie złóż testowego build-a:
* [Konfiguracja środowiska do testów](http://ace3mod.com/wiki/development/setting-up-the-development-environment.html) – intrukcja krok-po-kroku jak poprawnie ustawić i zbudować wersję ACE do celów testowych.