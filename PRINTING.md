# Printing to the Samsung M2020

The printer is shared over the network via AirPrint and is available to any device on the local network.

---

## iPhone / iPad

No setup needed. AirPrint discovers the printer automatically.

1. Open the document or photo you want to print
2. Tap the share icon → **Print**
3. Select **Samsung M2020 Series**
4. Print

---

## Mac

> **Important:** Do not use the Samsung driver or any downloaded PPD. Use **Generic PostScript Printer** as shown below.

1. Open **System Settings** → **Printers & Scanners**
2. Click **Add Printer, Scanner or Fax...**
3. The printer should appear as **Samsung M2020 Series** — select it
4. In the **Use** dropdown, select **Generic PostScript Printer**
5. Click **Add**

That's it. Print as normal from any app.

---

## Windows

1. Open **Settings** → **Bluetooth & devices** → **Printers & scanners**
2. Click **Add device**
3. If the printer doesn't appear automatically, click **Add manually**
4. Select **Add a printer using an IP address or hostname**
5. Enter the printer's IP address (check your router or ask the network admin)
6. Use port **631** and select **IPP** as the device type
7. When prompted for a driver, choose **Generic** → **MS Publisher Color Printer** or **Generic / Text Only**

---

## Troubleshooting

- **Printer not found:** Make sure you're on the home Wi-Fi network (not a guest network)
- **Job fails on Mac:** Check that **Generic PostScript Printer** is selected as the driver — using any Samsung-specific driver will cause errors
- **Job stuck / not printing:** Try cancelling the job and printing again; if it persists, restart the printer
