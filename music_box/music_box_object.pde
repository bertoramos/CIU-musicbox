
class MusicBox
{
  
  private PShape head_doll_obj, legs_obj, platform_obj, key_obj, musicbox_obj, wheel_obj;
  private float doll_angle, key_angle, wheel_angle;
  
  private PVector location;
  
  private float moveSpeed;
  private float moveFriction;
  
  private float windUpSpeed;
  private float windUpFriction;
  
  public final float maxMoveSpeed;
  
  private float head_angle;
  private float head_dir;
  private float max_head_angle;
  
  private final int head_hold_def = 50;
  private int head_hold = head_hold_def;
  
  MusicBox(PVector location)
  {
    this.location = location;
    
    // Objetos
    head_doll_obj = loadShape("obj\\head\\head.obj");
    legs_obj = loadShape("obj\\legs\\legs.obj");
    platform_obj = loadShape("obj\\platform\\platform.obj");
    key_obj = loadShape("obj\\key\\key.obj");
    musicbox_obj = loadShape("obj\\musicbox_color\\musicbox_color.obj");
    musicbox_obj.scale(100);
    wheel_obj = loadShape("obj\\wheel\\wheel.obj");
    // Colores
    key_obj.setFill(color(100, 80, 100));
    wheel_obj.setFill(color(100, 80, 100));
    platform_obj.setFill(color(150, 150, 255));
    
    // Angulos de rotation para movimiento de avance
    this.doll_angle = 0;
    this.key_angle = 0;
    this.wheel_angle = 0;
    
    // Velocidad de movimiento de avance
    this.moveSpeed = 0;
    this.moveFriction = PI/32784;
    
    // Velocidad de angulo de dar cuerda
    this.windUpSpeed = -PI/64;
    this.windUpFriction = PI/(4096*2);
    
    // Maxima velocidad de movimiento
    this.maxMoveSpeed = PI/32;
    
    // Head doll angle
    this.head_angle = 0;
    this.head_dir = 1;
    this.max_head_angle = +PI/4;

  }
  
  public float getSpeed() {
    return this.moveSpeed;
  }
  
  private void update_head_movement(float speed) {
    if(head_angle >= this.max_head_angle)
    {
      if(head_hold > 0) {
        head_hold--;
      } else {
        this.head_dir = -1;
        head_hold = head_hold_def;
        
        this.head_angle += this.head_dir*speed/2;
      }
    } else if(head_angle <= -this.max_head_angle) {
      if(head_hold > 0) {
        head_hold--;
      } else {
        this.head_dir = +1;
        head_hold = head_hold_def;
        
        this.head_angle += this.head_dir*speed/2;
      }
    } else {
      this.head_angle += this.head_dir*speed/2;
    }
    
  }
  
  void infiniteMove() {
    this.doll_angle += this.maxMoveSpeed;
    this.key_angle += this.maxMoveSpeed;
    this.wheel_angle += this.maxMoveSpeed;
    
    update_head_movement(this.maxMoveSpeed);
    
    this.drawObjects(doll_angle, wheel_angle, key_angle, head_angle);
  }
  
  void windUp()
  {
    if(this.moveSpeed >= this.maxMoveSpeed) {
      this.moveSpeed = this.maxMoveSpeed;
    } else {
      this.key_angle += this.windUpSpeed;
      this.moveSpeed += this.windUpFriction;
    }
    
    this.drawObjects(doll_angle, wheel_angle, key_angle, head_angle);
  }
  
  void move()
  {    
    // Rotar muñeco, rueda y llave
    this.doll_angle += this.moveSpeed;
    this.key_angle += this.moveSpeed;
    this.wheel_angle += this.moveSpeed;
    
    
    update_head_movement(this.moveSpeed);
    
    this.moveSpeed -= this.moveFriction;
    this.moveSpeed = this.moveSpeed <= 0 ? 0 : this.moveSpeed;
    
    this.drawObjects(doll_angle, wheel_angle, key_angle, head_angle);
  }
  
  
  private void drawObjects(float doll_rot, float wheel_rot, float key_rot, float head_angle)
  {
    pushMatrix();
      translate(location.x, location.y, location.z);
      
      pushMatrix();
        translate(0, -3.9, 0);
        rotateX(PI);
        rotateY(doll_rot);
        
        shape(platform_obj);
        shape(legs_obj);        
                        
        translate(0.2, 2, 0);
        rotateX(head_angle);
        
        shape(head_doll_obj);
      popMatrix();
      
      pushMatrix();
        translate(0, 0, 0);
        rotateX(PI);
        shape(musicbox_obj);
      popMatrix();
      
      pushMatrix();
        translate(-3.5, -4.5, 0);
        rotateX(wheel_rot);
        shape(wheel_obj);
      popMatrix();
      
      pushMatrix();
        translate(0, -1.6, -4);
        rotateX(-2*PI/4);
        rotateY(key_rot);
        shape(key_obj);
      popMatrix();
      
    popMatrix();
  }
  
}
