export default interface IStorage {
	ready(): Promise<void>;
	get<T>(key: string): Promise<T>;
	set<T>(key: string, value: T): Promise<T>;
	remove(key: string): Promise<void>;
	clear(): Promise<void>
}