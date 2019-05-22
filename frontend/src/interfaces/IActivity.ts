export interface IActivity {
  id: number;
  title: string;
  place: string;
  begins_at: Date;
  duration: number;
  description: string;
  max_participants: number;
  creator_id: number;
}
