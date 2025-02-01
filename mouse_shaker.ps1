Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class MouseMover {
    [StructLayout(LayoutKind.Sequential)]
    public struct INPUT {
        public int type;
        public MOUSEINPUT mi;
    }
    
    [StructLayout(LayoutKind.Sequential)]
    public struct MOUSEINPUT {
        public int dx;
        public int dy;
        public int mouseData;
        public int dwFlags;
        public int time;
        public IntPtr dwExtraInfo;
    }

    [DllImport("user32.dll", SetLastError = true)]
    public static extern uint SendInput(uint nInputs, INPUT[] pInputs, int cbSize);
    
    public const int INPUT_MOUSE = 0;
    public const int MOUSEEVENTF_MOVE = 0x0001;
    
    public static void MoveMouse(int dx, int dy) {
        INPUT[] input = new INPUT[1];
        input[0].type = INPUT_MOUSE;
        input[0].mi.dx = dx;
        input[0].mi.dy = dy;
        input[0].mi.dwFlags = MOUSEEVENTF_MOVE;
        SendInput(1, input, System.Runtime.InteropServices.Marshal.SizeOf(typeof(INPUT)));
    }
}
"@ -Language CSharp

while ($true)
{
    $randX = Get-Random -Minimum -10 -Maximum 11
    $randY = Get-Random -Minimum -10 -Maximum 11

    [MouseMover]::MoveMouse($randX, $randY)

    Start-Sleep -Milliseconds 100
}
