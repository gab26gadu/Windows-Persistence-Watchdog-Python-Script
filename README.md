# Windows Persistence & Watchdog Python Script

## Description

This project contains a Python script designed to provide advanced persistence, process monitoring, and self-protection features on Windows systems.  
The script attempts privilege elevation via UAC prompt, creates backup copies, maintains multiple persistence mechanisms (registry keys and scheduled tasks), monitors and restarts itself if terminated, and protects against debugging and analysis tools.

It also includes a batch script for stealth installation, which copies a user-provided executable to a hidden directory and launches it from there, enhancing operational stealth in real or testing scenarios.

---

## Key Features

- Privilege elevation with UAC prompt for administrative rights.  
- Automatic backup of the executable in a dedicated folder for self-repair.  
- Persistence via registry keys and scheduled tasks with elevated permissions.  
- Watchdog loop monitoring the process and restarting if killed.  
- SHA-256 integrity check to detect modifications or tampering.  
- Automatic termination of suspicious and unauthorized processes.  
- Batch script for stealth launch from a hidden folder with system attributes.

---

## Usage of the Batch Launcher

The batch script `launch_hidden.bat` is configured to use an executable named `PC_KILLER.exe`, which **must be provided by the user** and placed in the same folder as the batch file.

The batch script:  
- Creates a hidden folder `%ProgramData%\.SmaskHidden` if it doesn’t exist.  
- Copies `PC_KILLER.exe` to this hidden folder.  
- Starts the copied program from this stealth location.

To use an executable with a different name, modify the `SOURCE_EXE` variable inside the batch script accordingly.

---

## Behavior Without Administrative Privileges

When the Python script runs without administrator rights:

1. It detects lack of admin privileges via the `is_admin()` function.  
2. Attempts to restart itself with elevated rights using a UAC prompt (`run_as_admin()`).  
3. If the user **accepts** the UAC prompt, the script restarts with admin rights and operates fully.  
4. If the user **declines** or lacks permission to elevate:  
   - The script continues running without admin rights.  
   - Several features such as creating scheduled tasks with highest privileges, modifying protected registry keys, and terminating protected system processes **will fail silently or not work**.  
   - Persistence will be less effective and easier to remove.  
   - Terminating “annoying” processes like Task Manager or debuggers requiring admin rights will not be possible.

In short, without admin privileges, the script runs in a limited mode losing many of its core capabilities.

---

## Requirements

- Python 3.x  
- Python module `psutil` (install via pip)  
- Windows with UAC enabled

---

## Important Notes

- Intended for educational and experimental use in controlled environments (VMs or sandboxes).  
- Unauthorized use on production or third-party systems is illegal and can cause harm.  
- Terminating system processes can compromise Windows stability.  
- Use responsibly and with awareness.

---

## License

MIT License (or choose your own)

---

Made with care by Smask  
