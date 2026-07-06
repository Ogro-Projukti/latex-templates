# bdletter

A LaTeX class for writing authentic Bangladeshi official letters.

Supports government offices, schools, colleges, banks, NGOs, and general public use.
Works with **XeLaTeX** and **Tectonic**.

---

## What is this?

In Bangladesh, official letters — whether to a school principal, a bank manager, or a government office — all follow the same well-known structure:

```
তারিখ
বরাবর (recipient)
বিষয় (subject)
জনাব / মহোদয় (salutation)
... letter body ...
বিনীত নিবেদক (closing)
```

`bdletter` gives you this structure as a proper LaTeX class. You fill in your details, write your letter body, and the class handles the layout automatically.

---

## Who is this for?

- Anyone who writes official letters in Bangla
- Office staff, teachers, students, NGO workers, bank customers
- LaTeX users who want a clean, reusable Bangla letter template
- Developers building document tools for Bangladesh

You do **not** need to know LaTeX deeply to use this. The examples below show everything you need.

---

## Requirements

| Requirement | Details |
|---|---|
| Compiler | XeLaTeX or [Tectonic](https://tectonic-typesetting.github.io) |
| Font | Bundled — no installation needed |

> The font **Noto Serif Bengali** is already included in the `fonts/` folder inside this project. You do not need to install anything. Just clone the repository and compile.

---

## Quick Start

**Step 1** — Put `bdletter.cls` in the same folder as your `.tex` file.

**Step 2** — Create your letter file:

```latex
\documentclass{bdletter}

\LetterSetup{
  date         = {০১ জানুয়ারি ২০২৪ খ্রিঃ},
  recipient    = {জনাব মোহাম্মদ আলী},
  designation  = {প্রধান শিক্ষক},
  organization = {ঢাকা সরকারি উচ্চ বিদ্যালয়},
  address      = {পলাশী, ঢাকা-১০০০},
  subject      = {ছুটির জন্য আবেদন},
  name         = {মোঃ রহিম উদ্দিন},
  position     = {দশম শ্রেণি, রোল নং: ০৫},
  contact      = {মোবাইল: ০১৭১২-০০০০০০},
}

\begin{document}
\PrintLetterHeader

বিনীত নিবেদন এই যে, আমি আপনার বিদ্যালয়ের দশম শ্রেণির একজন নিয়মিত ছাত্র ...

অতএব, মহোদয়ের নিকট বিনীত প্রার্থনা, আমাকে ৫ দিনের ছুটি মঞ্জুর করবেন।

\PrintLetterFooter
\end{document}
```

**Step 3** — Compile with Tectonic or XeLaTeX:

```bash
tectonic your-letter.tex
```

---

## All Available Fields

These go inside `\LetterSetup{ ... }`. All fields are optional — leave out what you don't need.

### Recipient (প্রাপক)

| Field | What it does | Example |
|---|---|---|
| `date` | Date at the top of the letter | `০১ জানুয়ারি ২০২৪ খ্রিঃ` |
| `recipient` | Recipient's name | `জনাব মোহাম্মদ আলী` |
| `designation` | Recipient's job title | `প্রধান শিক্ষক` |
| `organization` | Office or institution name | `ঢাকা সরকারি উচ্চ বিদ্যালয়` |
| `address` | Recipient's address | `পলাশী, ঢাকা-১০০০` |
| `through` | Routing authority (মাধ্যম) — leave blank to hide | `যথাযথ কর্তৃপক্ষ` |

### Letter Style

| Field | What it does | Default |
|---|---|---|
| `subject` | Subject line (বিষয়) — printed in bold | — |
| `salutation` | Opening greeting | `জনাব` |
| `closing` | Closing word before signature | `বিনীত নিবেদক` |

> Use `জনাব` when writing to a named person. Use `মহোদয়` when writing to an institution or unknown recipient.

### Sender (প্রেরক)

| Field | What it does | Example |
|---|---|---|
| `name` | Your name | `মোঃ রহিম উদ্দিন` |
| `position` | Your title, class, or designation | `দশম শ্রেণি, রোল নং: ০৫` |
| `sender_org` | Your office or address | `গ্রাম: উত্তর বাড্ডা, ঢাকা` |
| `contact` | Phone or email | `মোবাইল: ০১৭১২-০০০০০০` |

---

## The মাধ্যম Field

Some formal letters — especially to government offices — are routed through an authority. Use the `through` field for this:

```latex
through = {যথাযথ কর্তৃপক্ষ},
```

This prints:

```
মাধ্যম: যথাযথ কর্তৃপক্ষ।
```

If you leave `through` empty or don't include it, this line is hidden automatically.

---

## Examples

The `examples/` folder contains ready-to-use letter templates:

| File | Letter Type |
|---|---|
| `school-leave.tex` | ছুটির আবেদন — Leave application to school |
| `job-application.tex` | চাকরির আবেদন — Job application letter |
| `bank-request.tex` | ব্যাংক আবেদন — Bank statement request |

To compile an example, copy `bdletter.cls` one folder up (the `bdletter/` root), then run:

```bash
tectonic examples/school-leave.tex
```

---

## Page Layout

| Setting | Value |
|---|---|
| Paper | A4 |
| Top margin | 1 inch |
| Bottom margin | 1 inch |
| Left margin | 1.25 inch |
| Right margin | 1 inch |
| Page number | None |
| Header / Footer | None |

---

## Fonts

### Bundled font (no setup needed)

The font **Noto Serif Bengali** is already included in the `fonts/` folder:

```
bdletter/
  fonts/
    NotoSerifBengali-Regular.ttf
    NotoSerifBengali-Bold.ttf
```

`bdletter.cls` loads these files automatically. You do not need to install anything on your system.

### Using a different font

If you want to use a different Bengali font, download it and place the `.ttf` files inside the `fonts/` folder. Then open `bdletter.cls` and update these two lines:

```latex
\newfontfamily\bengalifont[
  Path       = fonts/,
  Extension  = .ttf,
  BoldFont   = YourFont-Bold,
  Script     = Bengali,
  Ligatures  = TeX
]{YourFont-Regular}

\setmainfont[
  Path       = fonts/,
  Extension  = .ttf,
  BoldFont   = YourFont-Bold,
  Script     = Bengali,
  Ligatures  = TeX
]{YourFont-Regular}
```

Replace `YourFont-Regular` and `YourFont-Bold` with your actual file names (without the `.ttf` extension).

### Installing a font system-wide (optional)

If you prefer to install the font on your computer instead of bundling it:

**Windows:**
1. Download the font zip from [Google Fonts — Noto Serif Bengali](https://fonts.google.com/noto/specimen/Noto+Serif+Bengali)
2. Extract the zip
3. Open the `static/` folder inside
4. Select `NotoSerifBengali-Regular.ttf` and `NotoSerifBengali-Bold.ttf`
5. Right-click → **Install for all users**

**macOS:**
1. Download and extract the zip
2. Double-click each `.ttf` file
3. Click **Install Font**

**Linux:**
```bash
mkdir -p ~/.local/share/fonts
cp NotoSerifBengali-Regular.ttf ~/.local/share/fonts/
cp NotoSerifBengali-Bold.ttf ~/.local/share/fonts/
fc-cache -fv
```

---

## Writing in Bangla and English

`bdletter` supports **both Bangla and English** in the same document. You can mix them freely anywhere — in the letter body, subject line, recipient block, or signature.

### Bangla only

```latex
বিনীত নিবেদন এই যে, আমি আপনার প্রতিষ্ঠানে কর্মরত একজন কর্মচারী।
```

### English only

```latex
I am writing to request a bank statement for the period of January 2024.
```

### Mixed — Bangla and English together

```latex
আমার হিসাব নম্বর (Account Number) হলো 1234567890।
চিকিৎসকের পরামর্শ অনুযায়ী আমাকে complete bed rest-এ থাকতে বলা হয়েছে।
```

This works because `bdletter` uses `polyglossia`, which handles multi-script documents natively. You do not need any special commands to switch between Bangla and English — just type naturally.

### How to type Bangla

You need a Bangla keyboard layout enabled on your system.

**Windows:**
1. Go to **Settings → Time & Language → Language**
2. Click **Add a language** → search **Bengali (Bangladesh)**
3. Install it
4. Use **Windows + Space** to switch between English and Bangla keyboards
5. Use the **Avro Phonetic** layout for phonetic typing (recommended) — download from [omicronlab.com](https://www.omicronlab.com/avro-keyboard.html)

**macOS:**
1. Go to **System Settings → Keyboard → Input Sources**
2. Click **+** → search **Bengali**
3. Add **Bengali — Transliteration** for phonetic typing
4. Use **Control + Space** to switch

**Linux:**
Install `ibus-m17n` or `fcitx` with Bengali support, then add Bengali input method.

> **Tip:** Most Bangla LaTeX users type using **Avro Phonetic** on Windows. It lets you type Bangla using English phonetics — for example, typing `ami` produces `আমি`.

---

## Part of the bd-documents Ecosystem

`bdletter` is the first class in a planned family of Bangladeshi document templates:

| Class | Purpose |
|---|---|
| `bdletter` | Official letters and applications ✓ |
| `bdnotice` | Office notices — planned |
| `bdmemo` | Internal memos — planned |
| `bdreport` | Formal reports — planned |
| `bdcertificate` | Certificates — planned |

All classes share the same design language and Bengali font stack.

---

## License

MIT License — free to use, modify, and distribute.

---

## Contributing

Pull requests are welcome. If you find a formatting issue or want to add a new example letter, please open an issue first to discuss.