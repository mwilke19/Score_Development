Table scores;

void setup() {
  size(600, 600);
}

void draw() {
  background(25);
  load_table();
  display_table();
  add_new_score();
  println(scores.getRowCount());
  save_table();
}
void load_table() {
  scores = null;
  scores = loadTable("SCORES.csv", "header");
  if (scores != null) {
    scores.sortReverse(1);
  } else {
    println("NO FILE DETECTED: INITIALIZE");
    //create_table();
  }
}
void create_table() {
  scores = new Table();
  String initials = "MJW";
  String name = new String(initials);
  float num_of_kills = random(100);

  scores.addColumn("NAME");
  scores.addColumn("SCORE");

  TableRow new_row = scores.addRow();

  new_row.setString("NAME", name);
  new_row.setFloat ("SCORE", num_of_kills);
}
void display_table() {
  textSize(50);
  noStroke();
  fill(255, 255, 255);

  textAlign(CENTER);
  text("TOP 5 SCORES:", width/2, 100);
  text("NAME", width/2 - 100, 175);
  text("SCORE", width/2 + 100, 175);

  fill(255, 255, 0);
  for (int i = 0; i < scores.getRowCount(); i++) {
    TableRow row = scores.getRow(i);
    String name = row.getString("NAME");
    int score = row.getInt("SCORE");
    int y = 225 + (50 * i);
    text(name, width/2 - 100, y);
    text(score, width/2 + 100, y);
  }
}
void save_table() {
  saveTable(scores, "data/SCORES.csv");
}
void add_new_score(){
if (mousePressed) {
    String name = "ABC";
    float num_of_kills = random(100);
    TableRow new_score = scores.addRow();
    new_score.setString("NAME",name);
    new_score.setFloat("SCORE",num_of_kills);
    println(scores.getRowCount());
  }
}
