#include <iostream>
#include <typeinfo>

template <class Derived>
class AddInterface {
public:
    void method() {
        std::cout << "m()\n";
        static_cast<Derived*>(this)->core_method();
    }
    
    Derived& get_obj() {
        return *static_cast<Derived*>(this);
    }
};

class A : public AddInterface<A> {
public:
    friend class AddInterface<A>;
    A(int v=7) : _v{v} {}
    A(A const& other) : _v{other._v} {std::cout << "Cloned!\n";}
    
    void core_method() {std::cout << "core method called!\n";}
    
    int x = 7;
private:
    int _v;
};

class B : public AddInterface<B> {
public:
    void core_method() {std::cout << "B's core\n";}
};


int main() {
    A a;
    a.method(); // method from the AddInterface
    // and that wouldn't be magical, if the method itself
    // didn't use the A's methods!
    
    std::cout << a.get_obj().x << "\n";
    std::cout << typeid(a.get_obj()).name() << "\n";
    std::cout << typeid(a).name() << "\n";
    
    std::cout << (typeid(a) == typeid(a.get_obj()) ? "a.get_obj -> A" : "N");
    
    B b;
    b.method();
    
    std::cout << typeid(b.get_obj()).name() << "\n";
    std::cout << typeid(b).name() << "\n";
    
    std::cout << (typeid(b) == typeid(b.get_obj()) ? "b.get_obj -> B" : "N");
    
}
