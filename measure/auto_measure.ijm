macro "Batch Measure" {
    dir = getDirectory("Choose a Directory ");
    list = getFileList(dir);
    if (getVersion>="1.40e")
        setOption("display labels", true);
    setBatchMode(true);
    for (i=0; i<list.length; i++) {
        path = dir+list[i];
        showProgress(i, list.length);
        if (!endsWith(path,"/")) open(path);
        if (nImages>=1) {
          run("Split Channels");
		  selectWindow(list[i] +" (blue)");
		  setAutoThreshold("Default dark");
		  //run("Threshold...");
		  run("Measure");
		  selectWindow(list[i] +" (red)");
		  setAutoThreshold("Default dark");
		  //run("Threshold...");
		  run("Measure");
		  close();
		  close();
		  close();
        }
    }
}