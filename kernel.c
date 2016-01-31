void kernel_main(void) {
	const char *display = "hello world!";
	//call video memory starting at address 0xb8000
	char *video_pointer = (char*)0xb8000;
	unsigned int i = 0;
	unsigned int j = 0;
	unsigned int size_of_screen;

	//clear screen 
	size_of_screen = 80*25*2;
	while (j < size_of_screen) {
		video_pointer[j] = ' ';
		video_pointer[j+1] = 0x07;
		j = j + 2;
	}

	j = 0;
	
	//write string to video memory
	while (display[j] != '\0') {
		video_pointer[i] = display[j];
		video_pointer[i+1] = 0x07;
		++j;
		i = i + 2;
	}

	return;
}
