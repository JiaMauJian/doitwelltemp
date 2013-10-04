using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for clsPainter
/// </summary>
public class clsPainter
{
    public string book_id { get; set; }
    public string page_id { get; set; }
    public string session_id { get; set; }
    public int step_id { get; set; }
    public string object_type { get; set; }
    public double object_height { get; set; }
    public double object_width { get; set; }
    public double position_top { get; set; }
    public double position_left { get; set; }
    public double angle { get; set; }
    public string fill { get; set; }
    public string filpX { get; set; }
    public string flipY { get; set; }
    public string hasBorders { get; set; }
    public string hasControls { get; set; }
    public string hasRotatingPoint { get; set; }
    public double opacity { get; set; }  
    public string overlayFill { get; set; }
    public double scaleX { get; set; }
    public double scaleY { get; set; }  
    public string selectable { get; set; } 
}