---
theme: ./theme
addons:
  - fancy-arrow
fonts:
  sans: "CMU-Roman"
  serif: "CMU-Roman"
  mono: "CMU-Typewriter"
  provider: none
title: Работа с библиотекой и тестированием
info: |
  Вторая лекция курса "Engineering Open Source Projects".
  Создана Антоном Гришиным в рамках образовательного проекта CPM и CU 2026.
drawings:
  persist: false
transition: slide-left
mdc: true
duration: 40min
favicon: 'https://cdn.jsdelivr.net/gh/alchemmist/blog@main/site/static/favicon.ico'
date: 20 февраля 2026
layout: intro
---

# Lecture 2 — Библиотека и тестирование

<p>
  Anton Grishin (<a href="https://t.me/alchemmist"><span class="mono-text">@alchemmist</span></a>)
</p>

Введение во вторую лекцию EOSP.

---
layout: center
---

# Содержание

|                                                |                                                   |
| ---------------------------------------------- | ------------------------------------------------- |
| <code style="color:#50C878">homework</code>  | Домашнее задание по GitHub Flow и Python testing |
| <code style="color:#0096FF">uv</code>        | Учимся работать с package manager `uv`           |
| <code style="color:#FFBF00">library</code>   | Почему библиотека — ядро системы, обзор `lib`   |
| <code style="color:#FF69B4">live-demo</code> | Добавление первой метрики end-to-end             |
| <code style="color:#D22B2B">practice</code> | Работа в парах: решаем issue, делаем pull request |
| <code style="color:#5D3FD3">testing</code>  | Тестирование, TDD, защита качества кода        |
| <code style="color:#FF7F50">next</code>     | Анонс следующей лекции                            |

---
layout: center
---

# Домашнее задание <MarkerX color="#50C878" title="homework" />

1. Прочитать longreads о GitHub Flow (лекция 1).
2. Прочитать longread о тестировании на Python в рамках подготовки к лекции 2.

---
layout: center
---

# Работа с `uv` package manager <MarkerX color="#0096FF" title="uv" />

1. Что такое `uv` и зачем нужен пакетный менеджер.
2. Установка пакетов и управление зависимостями.
3. Обновление и фиксация версий.
4. Практическое использование в проекте.

---
layout: center
---

# Почему библиотека — ядро системы <MarkerX color="#FFBF00" title="library" />

1. Библиотека — нижний уровень интерфейса.
2. Централизованная обработка данных и логики.
3. Переиспользуемость функций для CLI и Telegram бота.
4. Обеспечение единых тестов и стандартов кода.

---
layout: center
---

# Обзор репозитория `lib` <MarkerX color="#FFBF00" title="library" />

1. Структура проекта: модули, utils, tests.
2. Конвенции и соглашения по стилю кода.
3. Дизайн библиотеки: функции должны быть модульными и тестируемыми.
4. Связь с CLI и ботом.

---
layout: center
---

# Live-demo: первая метрика end-to-end <MarkerX color="#FF69B4" title="live-demo" />

1. API → логика → тест.
2. Добавление функции расчета метрики.
3. Создание теста для этой метрики.
4. Проверка корректности работы на примере данных.

---
layout: center
---

# Практика: работа в парах <MarkerX color="#D22B2B" title="practice" />

1. Найти issue в репозитории.
2. Решить задачу и сделать pull request.
3. Обмен ролями: один пишет код, другой пишет тесты.
4. Обсуждение, почему тестов пока нет и как их добавлять.

---
layout: center
---

# Зачем тестировать код <MarkerX color="#5D3FD3" title="testing" />

1. Тесты — базовая защита качества.
2. Не привилегия, а минимум для поддерживаемого проекта.
3. Тесты формируют «защитную стену» от ошибок.
4. Позволяют уверенно рефакторить и развивать библиотеку.

---
layout: center
---

# Как писать тесты на Python <MarkerX color="#5D3FD3" title="testing" />

1. Принципы Test Driven Development (TDD).
2. Создание unit-тестов для функций библиотеки.
3. Проверка корректности логики.
4. Автоматизация тестов с помощью CI.

---
layout: center
---

# Практика: добавляем тесты <MarkerX color="#5D3FD3" title="testing" />

1. Каждый студент добавляет тест к своему pull request.
2. Пары могут менять роли: один пишет код, другой пишет тест.
3. Проверка работы тестов через CI.
4. Обсуждение результатов и ошибок.

---
layout: center
---

# Анонс следующей лекции <MarkerX color="#FF7F50" title="next" />

1. Работа с CLI: подключение к библиотеке и выполнение команд.
2. Реализация дополнительных метрик.
3. Интеграция с Telegram ботом.
4. Продолжение практики тестирования и CI/CD.

