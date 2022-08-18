const canvas = document.getElementById('canvas1');
const ctx = canvas.getContext('2d');
const CANVAS_WIDTH = canvas.whidth = 600;
const CANVAS_HEIGHT = canvas.height = 600;

const playerImage = new Image();
playerImage.src = 'shadow_dog.png';
const spriteWidth = 573;
const spriteHeigth = 523;


function animate(){
    ctx.clearRect(0, 0, CANVAS_WIDTH, CANVAS_HEIGHT);
    
    // Width sprite =  Image size divided by the number of columns
    // Height sprite = Image size divided by the number of Rows 

    //ctx.drawImage(playerImage, sx, sy, sw, sh, dx, dy, dw, dh);
    ctx.drawImage(playerImage, 0, 0, spriteWidth, spriteHeigth, 0, 0, spriteWidth, spriteHeigth);
    requestAnimationFrame(animate);
    
};
animate();








