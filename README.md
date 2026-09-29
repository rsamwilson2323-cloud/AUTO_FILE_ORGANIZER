
# 🗂️ AUTO FILE ORGANIZER — Universal File Management Tool

**AUTO FILE ORGANIZER** is a Windows-based automated file management tool that organizes files into separate folders based on their file extensions.

Instead of manually searching and arranging hundreds of files, this tool automatically scans a selected directory, including all its nested subfolders, identifies file types, creates category folders, and moves files into their respective locations.

Built using **Windows Batch (.bat) and PowerShell**, the project provides a simple and efficient way to organize files without requiring Python, Node.js, or any additional software installation.

---

# ✨ Features

## 📁 Automatic File Organization

Automatically identifies file extensions and moves files into their corresponding folders.

Example:

```text
photo.jpg       → Images
video.mp4       → Videos
presentation.pptx → PowerPoint
data.xlsx       → Excel
program.py      → Python
document.pdf    → PDF
```

---

## 🔍 Recursive Folder Scanning

The organizer scans:

- Main directory
- Subdirectories
- Nested folders
- Multiple levels of folders

It automatically collects files from all subfolders within the selected location.

```text
Selected Folder
      |
      ├── Images
      |     └── photo.jpg
      |
      ├── College
      |     ├── Assignments
      |     |      └── program.py
      |     |
      |     └── Seminar
      |            └── presentation.pptx
      |
      └── Projects
             └── video.mp4
```

All supported files are moved into their respective category folders in the main directory.

---

## 🖼️ Image Organizer

Automatically separates image files.

Supported extensions:

```text
.jpg
.jpeg
.png
.gif
.bmp
.webp
.svg
.ico
.tiff
.heic
```

Destination:

```text
Images/
```

---

## 🎥 Video Organizer

Automatically collects video files from all scanned folders.

Supported extensions:

```text
.mp4
.mkv
.avi
.mov
.wmv
.flv
.webm
.3gp
.m4v
```

Destination:

```text
Videos/
```

---

## 📊 PowerPoint Organizer

Separates presentation files.

Supported extensions:

```text
.ppt
.pptx
.pptm
.pps
.ppsx
.potx
```

Destination:

```text
PowerPoint/
```

---

## 📈 Excel Organizer

Automatically organizes spreadsheet files.

Supported extensions:

```text
.xls
.xlsx
.xlsm
.xlsb
.csv
.ods
```

Destination:

```text
Excel/
```

---

## 📝 Word Organizer

Collects document files.

Supported extensions:

```text
.doc
.docx
.docm
.rtf
.odt
```

Destination:

```text
Word/
```

---

## 🐍 Python Code Organizer

Automatically separates Python-related files.

Supported extensions:

```text
.py
.pyw
.pyc
.ipynb
```

Destination:

```text
Python/
```

---

## 📄 PDF Organizer

Collects all PDF documents.

```text
.pdf
```

Destination:

```text
PDF/
```

---

# 📂 Supported File Categories

| Category | Supported Extensions |
|---|---|
| 🖼️ Images | JPG, JPEG, PNG, GIF, BMP, WEBP, SVG |
| 🎥 Videos | MP4, MKV, AVI, MOV, WMV, WEBM |
| 🔊 Audio | MP3, WAV, AAC, FLAC, OGG, M4A |
| 📊 PowerPoint | PPT, PPTX, PPTM, PPSX |
| 📈 Excel | XLS, XLSX, XLSM, CSV, ODS |
| 📝 Word | DOC, DOCX, DOCM, RTF, ODT |
| 🐍 Python | PY, PYW, PYC, IPYNB |
| 📄 PDF | PDF |
| 🌐 Web Files | HTML, CSS, JS, JSX, TS, TSX, PHP |
| 💻 C and C++ | C, CPP, H, HPP, CC |
| ☕ Java | JAVA, CLASS, JAR |
| #️⃣ CSharp | CS |
| 📦 Archives | ZIP, RAR, 7Z, TAR, GZ |
| ⚙️ Applications | EXE, MSI, APK |
| 📜 Scripts | CMD, PS1, VBS, SH |
| 🔤 Fonts | TTF, OTF, WOFF, WOFF2 |
| 🗄️ Databases | DB, SQLITE, SQLITE3, MDB |
| 🎨 Design Files | PSD, AI, EPS, FIG, BLEND, OBJ, STL |
| 💽 Disk Images | ISO, IMG, DMG |
| 🗂️ Backup Files | BAK |
| 🕒 Temporary Files | TMP |
| 📁 Others | Unrecognized file extensions |

---

# 🛡️ Safe Directory Management

## 📍 Selected Location Only

The application operates only within the directory where the BAT file is placed.

For example:

```text
D:\My Files\
```

It will scan:

```text
D:\My Files\
D:\My Files\College\
D:\My Files\Projects\
D:\My Files\College\Assignments\
```

It will not intentionally access parent directories or unrelated locations.

---

## 🔒 Duplicate File Protection

If two files have the same name, the organizer avoids overwriting existing files.

Example:

```text
Images/
│
├── photo.jpg
├── photo_1.jpg
├── photo_2.jpg
└── photo_3.jpg
```

---

## 📂 Existing Folder Protection

The organizer recognizes its category folders and skips them during subsequent scans.

This helps prevent repeatedly organizing the same files.

---

## ⚠️ Move Instead of Copy

The application uses a move operation.

Original files are relocated into category folders rather than duplicated.

Empty original directories are not automatically deleted.

---

# 📂 Project Structure

```text
AUTO_FILE_ORGANIZER/
│
├── AUTO_FILE_ORGANIZER.bat
│
├── Organizer.ps1
│
└── README.md
```

---

# 📄 Important Files

## `AUTO_FILE_ORGANIZER.bat`

The main Windows launcher.

Responsibilities:

- Displays the organizer interface.
- Identifies the current directory.
- Starts PowerShell.
- Executes the organizing script.
- Keeps the process visible.

## `Organizer.ps1`

The main file organization engine.

Responsibilities:

- Scans files recursively.
- Identifies file extensions.
- Creates category folders.
- Moves files automatically.
- Prevents duplicate overwrites.
- Skips existing category folders.
- Displays file movement information.
- Reports successful and failed operations.

---

# ⚙️ Installation

## 1️⃣ Clone the Repository

```bash
git clone https://github.com/rsamwilson2323-cloud/AUTO_FILE_ORGANIZER.git
```

Navigate into the project:

```bash
cd AUTO_FILE_ORGANIZER
```

---

# 🖥️ Requirements

| Requirement | Details |
|---|---|
| Operating System | Windows 10 / Windows 11 |
| Shell | Windows PowerShell |
| File Format | BAT and PS1 |
| Internet | Not required |
| Python | Not required |
| Node.js | Not required |
| Additional Packages | Not required |

---

# 🚀 How to Use

## 1️⃣ Place the Files

Keep both files inside the same directory.

```text
AUTO_FILE_ORGANIZER.bat
Organizer.ps1
```

## 2️⃣ Select Your Folder

Place the organizer files inside the folder you want to organize.

Example:

```text
D:\My Files\
```

## 3️⃣ Add Your Files

You can place files directly inside the folder or inside multiple nested folders.

Example:

```text
My Files/
│
├── College/
│     ├── photo.jpg
│     └── assignment.py
│
├── Projects/
│     ├── video.mp4
│     └── report.pdf
│
└── presentation.pptx
```

## 4️⃣ Run the Organizer

Double-click:

```text
AUTO_FILE_ORGANIZER.bat
```

## 5️⃣ Automatic Organization

The application will:

```text
Start Organizer
       |
       v
Identify Selected Directory
       |
       v
Scan All Subfolders
       |
       v
Identify File Extensions
       |
       v
Create Category Folders
       |
       v
Move Files Automatically
       |
       v
Handle Duplicate Names
       |
       v
Display Results
       |
       v
ORGANIZATION COMPLETED!
```

---

# 🖥️ Example Output

```text
==========================================
       UNIVERSAL FILE ORGANIZER
==========================================

ROOT: D:\My Files

Scanning files and subfolders...

Files found: 120

[MOVED] photo.jpg --> Images
[MOVED] video.mp4 --> Videos
[MOVED] program.py --> Python
[MOVED] presentation.pptx --> PowerPoint
[MOVED] report.pdf --> PDF
[MOVED] data.xlsx --> Excel

==========================================
       ORGANIZATION COMPLETED
==========================================

Total files scanned: 120
Files moved: 120
Files failed: 0

Location: D:\My Files
```

---

# 📊 Expected Result

### Before Organization

```text
My Files/
│
├── College/
│     ├── photo.jpg
│     ├── assignment.py
│     └── presentation.pptx
│
├── Projects/
│     ├── video.mp4
│     ├── report.pdf
│     └── data.xlsx
│
├── song.mp3
└── document.docx
```

### After Organization

```text
My Files/
│
├── AUTO_FILE_ORGANIZER.bat
├── Organizer.ps1
│
├── Images/
│     └── photo.jpg
│
├── Videos/
│     └── video.mp4
│
├── Python/
│     └── assignment.py
│
├── PowerPoint/
│     └── presentation.pptx
│
├── PDF/
│     └── report.pdf
│
├── Excel/
│     └── data.xlsx
│
├── Audio/
│     └── song.mp3
│
├── Word/
│     └── document.docx
│
└── Others/
```

---

# 🔄 Reusability

The organizer can be reused in different directories.

Simply copy both files into another folder and execute the BAT file.

Example:

```text
D:\College\AUTO_FILE_ORGANIZER.bat

D:\Projects\AUTO_FILE_ORGANIZER.bat

E:\Personal\AUTO_FILE_ORGANIZER.bat
```

Each execution organizes files within its own selected directory.

---

# ⚠️ Important Notes

- The application moves files instead of copying them.
- Keep the BAT and PowerShell files together.
- Do not manually delete the PowerShell script while the organizer is running.
- Files outside the selected directory are not intentionally accessed.
- Files that cannot be moved because of permission or access issues are reported.
- Test with a sample folder before organizing important files.
- The application does not automatically delete empty source folders.

---

# 🧠 How It Works

## 1️⃣ Directory Detection

PowerShell identifies the directory containing the organizer.

## 2️⃣ Recursive Scanning

The `Get-ChildItem` command searches files recursively.

## 3️⃣ Extension Identification

Each file's extension is converted into lowercase and matched against a predefined category dictionary.

## 4️⃣ Folder Creation

The application creates the required category folder if it does not already exist.

## 5️⃣ Duplicate Checking

Before moving a file, the application checks whether a file with the same name already exists.

## 6️⃣ File Movement

The `Move-Item` command relocates the file to its destination.

## 7️⃣ Result Reporting

The application displays:

```text
Total Files Scanned
Files Successfully Moved
Files Failed
Organization Location
```

---

# 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Windows Batch | Application launcher |
| PowerShell | File management engine |
| Windows File System | File scanning and organization |
| File Extensions | Automatic file classification |

---

# ⭐ What Makes This Project Useful?

### 🚀 Saves Time

No need to manually create folders and move files one by one.

### 📂 Handles Nested Directories

Automatically finds files across multiple folder levels.

### 🔍 Supports Multiple File Types

Organizes documents, media, programming files, archives, and more.

### 🛡️ Prevents Overwriting

Automatically generates numbered filenames for duplicates.

### 💻 Lightweight

Uses built-in Windows technologies without external dependencies.

### 🔄 Reusable Anywhere

Place the organizer inside any target folder and execute it.

---

# 🎯 Project Objective

The main objective of **AUTO FILE ORGANIZER** is to simplify file management through automated file classification and directory organization.

It demonstrates how Windows Batch and PowerShell can work together to automate repetitive file management tasks.

```text
Selected Directory
       +
Recursive Scanning
       +
File Type Detection
       +
Automatic Folder Creation
       +
File Movement
       =
🗂️ AUTO FILE ORGANIZER
```

---

# 👨‍💻 Author

**Sam Wilson**

🎓 B.E. CSE (Artificial Intelligence & Machine Learning)

🌐 GitHub:

https://github.com/rsamwilson2323-cloud

💼 LinkedIn:

https://www.linkedin.com/in/sam-wilson-14b554385/

---

# 📜 License

This project is intended for educational and personal use.

Refer to the repository for license information.

---

# ⭐ Repository

**AUTO FILE ORGANIZER**

https://github.com/rsamwilson2323-cloud/AUTO_FILE_ORGANIZER

If you find this project useful, consider giving the repository a ⭐ on GitHub!
